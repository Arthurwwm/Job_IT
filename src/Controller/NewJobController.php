<?php

namespace App\Controller;

use App\Entity\Jobs;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class NewJobController extends AbstractController
{
    /**
     * @Route("/new/job", name="newjob")
     */
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $job = new Jobs();
        // $job->setActive(1);
        // $job->setCreated(new \DateTime() );
        // $job->setUpdated(new \DateTime() );
        // $job->setExpire();
        // $job->setToken();

        $form = $this->createForm(NewJobType::class, $job);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $job = $form->getData();

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
