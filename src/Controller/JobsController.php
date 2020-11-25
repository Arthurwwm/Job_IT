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
    const JOBS_PAGE = 20;

    /**
     * @Route("/{categorie_id}", name="jobs")
     */
    public function jobsCateg(JobsRepository $jr,int $categorie_id): Response
    {

        $jobs = $jr->findBy(['category' => $categorie_id, 'active' => 1],);
        if (!$jobs) {             
            throw $this->createNotFoundException("La catégorie demandée n'existe pas");         
        }
        $nomCateg = $jobs[0]->getCategory()->getNom();
        return $this->render('jobs/index.html.twig', [
            'jobs' => $jobs,
            'nomCateg' => $nomCateg,
        ]);
    }

    /**
     * @Route("/{cat_id}/{job_id}", name="job")
     */
    public function job(JobsRepository $jr, $job_id): Response
    {

        $job = $jr->findBy(['id' =>$job_id,'active' =>1]);
        if (!$job) {             
            throw $this->createNotFoundException("L'annonce recherchée n'existe pas");         
        }
        return $this->render('jobs/job.html.twig', [
            'job' => $job,
        ]);
    }
}
