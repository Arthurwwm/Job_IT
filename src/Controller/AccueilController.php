<?php

namespace App\Controller;

use App\Entity\Jobs;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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

        return $this->render('accueil/index.html.twig', [
            'jobs' => $jobs,
        ]);
    }

    /**
     * @Route("/search/", name="search")
     */
    public function searchResult(EntityManagerInterface $em, Request $rq): Response
    {
        $query = $rq->query->get('q');
        $jobsRepo = $em->getRepository(Jobs::class);
        $jobs = $jobsRepo->search($query);
 
        return $this->render('accueil/search.html.twig', [
            'jobs' => $jobs,
        ]);
    }
}
