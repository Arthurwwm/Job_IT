<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategoriesController extends AbstractController
{
    /**
     * @Route("/{categorie}", name="categories")
     */
    public function categs(EntityManagerInterface $em, $categorie): Response
    {
        $category = $em-> getRepository(Categories::class) -> findOneBy(['nom' => $categorie],);
        
        if (!$category) {
            throw $this -> createNotFoundException("Cette catégorie n'existe pas");
        }
        return $this->render('categories/index.html.twig', [
            'category' => $category,
        ]);
    }
}
