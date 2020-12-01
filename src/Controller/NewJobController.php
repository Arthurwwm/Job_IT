<?php

namespace App\Controller;

use App\Entity\Jobs;
use App\Form\ModifJobType;
use App\Form\NewJobType;
use App\Service\FileUploader;
use App\Repository\JobsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class NewJobController extends AbstractController
{
    /**
     * @Route("/newjob", name="newjob")
     */
    public function new(Request $request, EntityManagerInterface $em, FileUploader $fileUploader): Response
    {
        $job = new Jobs();

        $form = $this->createForm(NewJobType::class, $job);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // gestion d'upload de l'image
            $file = $form['logo']->getData();
            if ($file) {
                $file_name = $fileUploader->upload($file);
                if ($file_name === null) {
                    throw $this->createNotFoundException("un souci avec votre fichier"); 
                }
            }
            $job = $form->getData();
            $job->setLogo($file_name);
            $job->setActive(1);
            $job->setCreated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));
            $job->setExpire(date_add(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')), date_interval_create_from_date_string('30 days')));
            $job->setUpdated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));
            $job->setToken(bin2hex(random_bytes(32)));

            $em->persist($job);
            $em->flush();

            return $this->redirectToRoute('lienmodif', ['id' => $job->getId()]);
        }

        return $this->render('new_job/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/lienmodif{id}", name="lienmodif")
     */
    public function lien($id, JobsRepository $jr)
    {
        $token = $jr->find($id);

        if (!$token) {             
            throw $this->createNotFoundException("Je ne trouve pas votre annonce");         
        }

        return $this->render('new_job/link.html.twig', [
            'token' => $token->getToken(),
        ]);
    }


    /**
     * @Route("/update/annonce/{token}", name="update")
     */
    public function update($token, JobsRepository $jr, EntityManagerInterface $em, Request $request, FileUploader $fileUploader)
    {
        // On recherche si un job avec ce token existe dans la base de données
        $job = $jr->findOneBy(['token' => $token]);
        
        // Récupérer la différence en jours entre maintenant et la fin d'activité de l'annonce
        /**
         * @param DateTime $oDate1
         * @param DateTime $oDate2
         * @return array 
         */
        function date_diff_array(\DateTime $oDate1, \DateTime $oDate2) {
            $aIntervals = array(
                'year'   => 0,
                'month'  => 0,
                'week'   => 0,
                'day'    => 0,
                'hour'   => 0,
                'minute' => 0,
                'second' => 0,
            );

            foreach($aIntervals as $sInterval => &$iInterval) {
                while($oDate1 <= $oDate2){ 
                    $oDate1->modify('+1 ' . $sInterval);
                    if ($oDate1 > $oDate2) {
                        $oDate1->modify('-1 ' . $sInterval);
                        break;
                    } else {
                        $iInterval++;
                    }
                }
            }

            return $aIntervals;
        }

        // Si aucun utilisateur n'est associé à ce token
        if(!$job){
            // On renvoie une erreur 404
            throw $this->createNotFoundException("Cette annonce n'existe pas");
        }

        $diff = date_diff_array(new \DateTime(), $job->getExpire());

        if( $diff['week'] < 1 && $diff['day'] < 5 ) {//ou si il reste moins de 5 jours avant la fin de validité de l'annonce
            // On renvoie une erreur 404
            throw $this->createNotFoundException("Cette annonce n'est plus modifiable");
        }


        //permettre de modifier l'annonce
        $formulModif = $this->createForm(ModifJobType::class, $job);

        $formulModif->handleRequest($request);
        if ($formulModif->isSubmitted() && $formulModif->isValid()) {
            // // gestion d'upload de l'image
            // $file = $formulModif['logo']->getData();
            // if ($file) {
            //     $file_name = $fileUploader->upload($file);
            //     if ($file_name === null) {
            //         throw $this->createNotFoundException("un souci avec votre fichier"); 
            //     }
            // }
            // $job = $formulModif->getData();
            // $job->setLogo($file_name);
            $job->setActive(1);
            $job->setExpire(date_add(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')), date_interval_create_from_date_string('30 days')));
            $job->setUpdated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));
            // Renvoie les modifs dans la base
            $em->persist($job);
            $em->flush();
            // On génère un message
            $this->addFlash('message', 'Annonce modifiée avec succès');
            
            // On retourne à l'accueil
            return $this->redirectToRoute('accueil');
        }
        return $this->render('new_job/modif.html.twig', [
            'form' => $formulModif->createView(),
            'job' => $job
        ]);
    }

}