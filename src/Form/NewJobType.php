<?php

namespace App\Form;

use App\Entity\Jobs;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class NewJobType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('intitule', TextType::class,[
                'label' => 'Intitulé du poste',
            ])
            ->add('contrat', TextType::class,[
                'label' => 'Type de Contrat',
                'placeholder' => 'CDI/CDD...'
            ])
            ->add('category', ChoiceType::class,)
            ->add('entreprise', TextType::class,[
                'label' => 'Votre Entreprise',
                'placeholder' => 'Google ?'
            ])
            ->add('logo')
            ->add('url', TextType::class)
            ->add('lieu', TextType::class,[
                'label' => 'Ville',
                ])
            ->add('pays', TextType::class,[
                'label' => 'Type de Contrat',
                'placeholder' => 'CDI/CDD...'
            ])
            ->add('description', TextareaType::class)
            ->add('email')
            ->add('postuler')

            ->add('expire')
            ->add('created')
            ->add('updated')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Jobs::class,
        ]);
    }
}
