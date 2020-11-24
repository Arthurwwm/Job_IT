<?php

namespace App\Controller;

use App\Repository\JobsRepository;
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
    public function index(JobsRepository $jR): Response
    {
        $jobs = $jR-> findBy(['active' => 1],['updated'=>'DESC','category'=>'ASC'],self::JOBS_PAGE,0);

        return $this->render('accueil/index.html.twig', [
            'jobs' => $jobs,
        ]);
    }
}
