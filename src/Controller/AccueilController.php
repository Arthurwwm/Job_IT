<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccueilController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index(EntityManagerInterface $em): Response
    {
        $repo = $em->getRepository(Jobs::class);
        $jobs = $repo-> findBy([],['category'=>'ASC']);

        return $this->render('accueil/index.html.twig', [
            'jobs' => $jobs,
        ]);
    }
}
