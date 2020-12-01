<?php

namespace App\Form;

use App\Entity\Jobs;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ModifJobType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('contrat')
            ->add('entreprise')
            // ->add('logo')
            ->add('url')
            ->add('pays')
            ->add('lieu')
            ->add('description')
            // ->add('token')
            // ->add('email')
            // ->add('active')
            // ->add('expire')
            // ->add('created')
            // ->add('updated')
            ->add('postuler')
            ->add('intitule')
            ->add('category')
            ->add('submit', SubmitType::class,[
                'label' => 'Ajout'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Jobs::class,
        ]);
    }
}
