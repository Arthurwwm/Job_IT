<?php

namespace App\Form;

use App\Entity\Jobs;
use App\Entity\Categories;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class NewJobType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('intitule', TextType::class,[
                'label' => 'Intitulé du poste',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Designer UX',
                ]
            ])
            ->add('contrat', TextType::class,[
                'label' => 'Type de Contrat',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'CDD/CDI...',
                ]
            ])
            ->add('category', EntityType::class,[
                'class' => Categories::class,
                'choice_label' => ''

            ])
            ->add('entreprise', TextType::class,[
                'label' => 'Votre Entreprise',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => "Nom de l'entreprise",
                ]            
            ])
            ->add('logo', FileType::class,[
                'label' => 'Ajouter votre image',
                'attr' => [
                    'class' => 'form-control',
                ]
            ])
            ->add('url', TextType::class,[
                'label' => 'Votre site',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => "www.entreprise.com",
                ]            
            ])
            ->add('lieu', TextType::class,[
                'label' => 'Ville',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Paris',
                ]
            ])
            ->add('pays', TextType::class,[
                'label' => 'Pays',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'France',
                ]
            ])

            ->add('description', TextareaType::class,[
                'label' => 'Description du poste',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => "Décrivez l'emploi !",
                ]            
            ])
            ->add('email', EmailType::class,[
                'label' => 'Votre Email',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => "email@entreprise.com",
                ]            
            ])
            ->add('postuler', TextareaType::class,[
                'label' => 'Où postuler',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Préparez CV et lettre de motivation à envoyer à recrutement@start-up.fr
                    ',
                ]
            ])
            ->add('submit', SubmitType::class,[
                'label' => 'Ajout'
            ])
            // ->add('token')
            // ->add('expire')
            // ->add('created')
            // ->add('updated')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Jobs::class,
        ]);
    }
}
