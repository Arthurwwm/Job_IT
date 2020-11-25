<?php

namespace App\Controller;

use App\Entity\Jobs;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccueilController extends AbstractController {
    /**
     * @const JOBS_PAGE nombre de jobs maximal à afficher
     */
    const JOBS_PAGE = 10;

    /**
     * @Route("/", name="accueil")
     */
    public function index(EntityManagerInterface $em): Response
    {
        $jobs = $em-> getRepository(Jobs::class) -> findBy(['active' => 1],['updated'=>'DESC'],self::JOBS_PAGE,0);
        //dd($jobs[0]);
        return $this->render('accueil/index.html.twig', [
            'jobs' => $jobs,
        ]);
    }
}
