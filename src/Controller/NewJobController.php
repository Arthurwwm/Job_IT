<?php

namespace App\Controller;

use App\Entity\Jobs;
use App\Form\NewJobType;
use App\Service\FileUploader;
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
                if ($file_name !== null) {
                    $directory = $fileUploader->getTargetDirectory();
                    $full_path = $directory.'/'.$file_name;
                }
            }
            $job = $form->getData();
            $job->setActive(1);
            $job->setCreated(new \DateTime() );
            $job->setUpdated(new \DateTime() );
            $job->setExpire(new \DateTime() );
            $job->setToken();
            // ... perform some action, such as saving the task to the database
            // for example, if Task is a Doctrine entity, save it!
            $em->persist($job);
            $em->flush();

            return $this->redirectToRoute('accueil');
        }

        return $this->render('new_job/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
