<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use App\Repository\JobsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class JobsController extends AbstractController
{
    /**
     * @const JOBS_PAGE nombre de jobs maximal à afficher
     */
    const JOBS_PAGE = 5;

    /**
     * @Route("/{categorie_id}", name="jobs")
     */
    public function jobsCateg(JobsRepository $jr, $categorie_id): Response
    {

        $jobs = $jr->findBy(['category' => $categorie_id],);
        if (!$jobs) {             
            throw $this->createNotFoundException("La catégorie demandée n'existe pas");         
        }
        $nomCateg = $jobs[0]->getCategory()->getNom();
        
        dd($nomCateg);
        return $this->render('jobs/index.html.twig', [
            'jobs' => $jobs,
            'nomCateg' => $nomCateg,
        ]);
    }
}
