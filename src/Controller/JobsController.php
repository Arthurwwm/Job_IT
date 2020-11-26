<?php

namespace App\Controller;

use App\Repository\JobsRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class JobsController extends AbstractController
{
    /**
     * @const JOBS_PAGE nombre de jobs maximal à afficher
     */
    const JOBS_PAGE = 20;

    /**
     * @Route("/cat{categorie_id}", name="jobs")
     */
    public function jobsCateg(JobsRepository $jr, int $categorie_id, PaginatorInterface $paginator, Request $request): Response
    {

        $data = $jr->findBy(['category' => $categorie_id, 'active' => 1],);
        $jobs = $paginator->paginate( 
            $data, 
            $request->query->getInt('page',1),
            2
        );

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
     * @Route("/{cat_nom}/{job_id}", name="job")
     */
    public function job(JobsRepository $jr, $job_id): Response
    {

        $job = $jr->findOneBy(['id' =>$job_id,'active' =>1]);
        if (!$job) {             
            throw $this->createNotFoundException("L'annonce recherchée n'existe pas");         
        }
        
        return $this->render('jobs/job.html.twig', [
            'job' => $job,
        ]);
    }
}
