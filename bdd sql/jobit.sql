-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 27 nov. 2020 à 07:01
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jobit`
--

-- --------------------------------------------------------

--
-- Structure de la table `affilies`
--

CREATE TABLE `affilies` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `affilies_categories`
--

CREATE TABLE `affilies_categories` (
  `affilies_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`) VALUES
(1, 'Design'),
(2, 'Développement'),
(3, 'Rédaction'),
(4, 'Réseaux Sécurité');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201123151014', '2020-11-23 16:10:39', 346),
('DoctrineMigrations\\Version20201125143508', '2020-11-25 15:37:29', 75),
('DoctrineMigrations\\Version20201126155800', '2020-11-26 16:58:18', 76);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `contrat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entreprise` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `expire` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `postuler` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`id`, `category_id`, `contrat`, `entreprise`, `logo`, `url`, `pays`, `lieu`, `description`, `token`, `email`, `active`, `expire`, `created`, `updated`, `postuler`, `intitule`) VALUES
(1, 1, 'FREELANCE', 'Upway.io', 'upway_io.png', 'https://www.upway.io/fr/', 'France', 'Lyon', 'L\'entreprise :\r\n\r\nAu sein d\'une équipe agile constituée de développeurs, votre mission consistera à garantir une expérience utilisateur optimale aux utilisateurs de la plateforme spécialisée dans la nutrition dans le secteur de la grande distribution.\r\n\r\nResponsabilités :\r\n\r\n- Proposer une expérience client qui correspond au cahier des charges\r\n- Concevoir des wireframes\r\n- Concevoir des maquettes sur l\'outil Figma\r\n- Cette mission est ouverte à du télétravail.\r\n\r\nPossibilité de renouvellement de mission pour d\'autres projets à venir.\r\n\r\nProfil attendu :\r\n\r\n- Vous êtes un(e) UI/UX confirmé(e) et vous justifiez d\'expériences similaires\r\n- Vous avez un portfolio que l\'on peut consulter\r\n- Idéalement, vous avez déjà travailler avec des start-ups ou TPE/PME\r\n\r\nSavoir-être :\r\n\r\n- Vous savez à la fois travailler en autonomie et en équipe\r\n- Vous êtes force de proposition\r\n\r\nInformations pratiques :\r\n\r\nDurée de 1 à 3 mois\r\nDébut le 04/01/2021\r\nMission freelance', NULL, 'a.salama@upway.io', 1, '2020-12-18 14:05:09', '2020-11-18 14:05:09', '2020-11-18 14:05:09', 'Préparez CV et lettre de motivation à envoyer à a.salama@upway.io', 'Ux/ui designer'),
(2, 2, 'CDI', 'Fondation Nationale de la Cité Internationale Universitaire de Paris', 'citeInternationaleUnivParis.gif', 'https://www.ciup.fr', 'France', 'Strasbourg Alsace', 'Dans le cadre du développement de notre activité, nous recherchons une développeuse ou un développeur PHP pour renforcer notre équipe. Vous interviendrez dans les phases de conception, de développement et de maintenance des projets, suivant le besoin des utilisateurs.\r\n\r\nIssu(e) d\'une formation Bac+2 en informatique, vous disposez d\'une expérience d\'au moins 2 ans dans le développement web.\r\n\r\nVos missions principales :\r\n\r\n· Vous participez à la conception, au développement et à l\'administration de nos applications web.\r\n· Vous en assurez la maintenance et réalisez évolutions et mises à jour.\r\n· Vous effectuez une assistance technique aux utilisateurs.\r\n· Vous concevez les tableaux de bord et les indicateurs de suivi d\'activité nécessaires aux rapports d\'activité.\r\n· Vous restez à jour des évolutions technologiques et partagez l\'information avec les collaborateurs et collaboratrices du service.\r\n\r\nCompétences demandées :\r\n· Back-End : PHP, SQL\r\n· Front-End : HTML5, CSS, Javascript\r\n· Compétences appréciées : Symfony 4, Bootstrap, JQuery, Git, MySQL ou MariaDB\r\n· Anglais technique\r\n\r\nQualités recherchées :\r\n· Autonomie et grande capacité d\'organisation.\r\n· Méthode et rigueur.\r\n· Esprit d\'équipe et d\'entraide.\r\n· Bonne qualité rédactionnelle.\r\n\r\nConditions :\r\n· CDI, temps plein, non cadre.\r\n· 13ème après un an d\'ancienneté\r\n· Le poste est basé à Strasbourg, avec des déplacements occasionnels.\r\n\r\nDate de début prévue : 04/01/2021\r\nType d\'emploi : Temps plein, CDI\r\nSalaire : 29 543,00€ par an', NULL, 'recrutement@ciup.fr', 1, '2020-12-21 16:09:34', '2020-11-21 16:09:34', '2020-11-21 16:09:34', 'Préparez CV et lettre de motivation à envoyer à recrutement@ciup.fr', 'Développeur.euse web'),
(3, 2, 'CDD', 'Makina Corpus', 'makina_corpus.jpg', 'https://makina-corpus.com', 'France', 'Toulouse Midi-Pyrénées', 'Vous rejoindrez une équipe pluridisciplinaire composée notamment d\'expert.es JavaScript et participerez aux différentes phases de projets web d\'envergure. Vous aurez pour missions :\r\n\r\n- Concevoir et développer des webapps et des applications front end Javascript destinées aussi bien à des ordinateurs qu\'à des smartphones, avec une utilisation intensive de React.\r\n\r\n- Optimiser les performances en fonction des navigateurs et de la puissance de la machine (méthodes de transfert des données, analyse des temps de transfert et d\'affichage, cycle de vie de la page, gestion mémoire...).\r\n\r\n- Participer à la production d\'un code collaboratif (publications, revues de code, pull requests...).\r\n\r\n- Contribuer à l\'amélioration continue des compétences de l\'équipe.\r\n\r\nProfil : niveau Bac +5 requis, idéalement ingénieur.e de formation. Mais il est vrai que nous attachons avant tout de l\'importance à vos compétences et à votre motivation.\r\n\r\nAu-delà de l\'expertise d\'un langage spécifique vous maîtrisez la programmation pour le web, et ce depuis à minima 3 ans. Nos outils privilégiés sont actuellement ES6, React/Redux, React Native, MapboxGL JS, D3, GraphQL...\r\n\r\n- Vous avez une solide expérience du langage JavaScript, avez su et saurez vous adapter aux évolutions des bonnes pratiques d\'ingénierie JavaScript et à de nouvelles bibliothèques.\r\n\r\n- Vous maîtrisez les pratiques modernes d\'ingénierie logicielle (tests automatisés, intégration continue, Scrum/Kanban...).\r\n\r\n- Vous savez optimiser l\'architecture d\'une application Front End, améliorer les performances, l\'accessibilité...\r\n\r\n- Vous êtes sensible aux problématiques d\'interface et d\'ergonomie et vous vous intéressez à l\'analyse des besoins des utilisateurs.trices.\r\n\r\nPourquoi nous rejoindre ? Parce que nous disons ce que nous faisons : nous évoluons dans une ambiance motivante et stimulante (projets et contrib Opensource, confs/meetup, coordination de sprints, bugfests, technos innovantes à tester, écriture d\'articles de blog, de livres blancs ...) et contribuons aux valeurs humaines ancrées dans l\'ADN de l\'entreprise (environnement, télétravail et équilibre vie pro/vie privée, collaboratif...).\r\n\r\n... parce que nous faisons ce que nous disons (même si nous n\'avons pas du tout la prétention d\'être parfaits...): vous avez besoin de le voir pour le croire ? Venez nous rencontrer, un.e expert.e pourra vous en parler !\r\n\r\nÉcrivez-nous, racontez-nous qui vous êtes et ce qui vous motive. Montrez-nous des preuves concrètes de votre motivation (compte Github, contributions, réalisations...).\r\n\r\nNos équipes sont mixtes, femmes et hommes du numérique rejoignez-nous !', NULL, 'recrutement@makina-corpus.com', 1, '2020-12-19 16:15:35', '2020-11-19 16:15:35', '2020-11-19 16:15:35', 'Préparez CV et lettre de motivation à envoyer à recrutement@makina-corpus.com', 'Expert.e javascript'),
(4, 2, 'CDI', 'MISTER EV', 'mister_ev.png', 'https://www.mister-ev.com/fr/', 'France', 'Strasbourg Alsace', 'Pour accompagner le développement de nos ventes, nous recherchons un.e développeur full stack spécialisé.e dans l\'e-commerce.\r\nEn lien avec la direction, vos missions chez Mister EV seront les suivantes :\r\n\r\nParticiper à déterminer les axes d\'amélioration du site Internet avec le reste de l\'équipe ;\r\n\r\nFaire évoluer la présentation du catalogue et des outils de recherche ;\r\nMettre en place des expérimentations (A/B testing) pour améliorer le taux de conversion du site ;\r\nParticiper à l\'industrialisation de la chaîne de traitement des commandes grâce à l\'évaluation de plugins WooCommerce adaptés ou des développements sur mesure ;\r\nConnecter les outils marketing nécessaires au développement des ventes pour rendre l\'équipe des ventes aussi autonome que possible ;\r\nDévelopper des pages pour optimiser le SEO ;\r\nGérer les mises à jour de Wordpress, WooCommerce et des plugins associés.\r\n\r\nSavoir-faire\r\n\r\nUne très bonne connaissance des technologies front-end (XHTML, CSS, SASS ou LESS, javascript) ;\r\nUne bonne connaissance de PHP / MySQL, Wordpress, et idéalement de WooCommerce ;\r\nAu minimum, une première expérience avec GIT ;\r\nUne bonne connaissance des outils et de l\'écosystème de l\'e-commerce ;\r\nUne sensibilité graphique qui permet de travailler sur un projet e-commerce sans forcément avoir besoin de l\'intervention d\'un designer ;\r\nUne bonne compréhension des bonnes pratiques SEO en matière de développement.\r\nSavoir-être\r\n\r\nAvoir envie de relever les challenges liés à la croissance d\'un site e-commerce ;\r\nSavoir travailler efficacement en équipe ;\r\nÊtre dynamique, autonome et faire preuve d\'initiative ;\r\nÊtre rigoureux et organisé ;\r\nAvoir l\'envie constante d\'apprendre et de s\'améliorer ;\r\nAvoir de l\'appétence pour l\'automobile, l\'énergie et une sensibilité environnementale.', NULL, 'maxime@brakson.com', 1, '2020-12-24 16:19:43', '2020-11-24 16:19:43', '2020-11-24 16:19:43', 'Préparez CV et lettre de motivation à envoyer à maxime@brakson.com', 'Développeur full stack - woocommerce (h / f)'),
(5, 2, 'CDI', 'SKILLD', 'skilld.jpg', 'https://www.skilld.fr/en', 'France', 'Malakoff Ile de France', 'Pour accompagner sa forte croissance, la société Skilld recherche\r\nun(e) chef de projet technique en CDI - H/F\r\nIl/Elle sera sous la responsabilité du directeur de projets et prendra totalement en charge les projets de ses clients.  Au quotidien, ses principaux rôles seront :\r\n- La relation client\r\n- La rédaction des spécifications fonctionnelles et techniques\r\n- Le suivi des projets et les comptes-rendus hebdomadaires\r\n- L\'encadrement en anglais des équipes techniques\r\n\r\nEvolution rapide dans la société en quelques années :\r\n- vers de la Direction de projet\r\n- vers de l\'Expertise technique / fonctionnelle\r\n- vers de la Direction Clientèle\r\n- vers des fonctions commerciales (Appels d\'offre, Avant-vente)\r\n \r\nDESCRIPTION DU CANDIDAT RECHERCHÉ\r\nTu es passionné(e) par les nouvelles technologies et notamment par le web, le mobile ou les objets connectés ?\r\nTu es auto-didacte ou hyper-diplomé(e)  ?\r\nTu souhaites rejoindre une équipe dynamique et acquérir une expérience riche à l\'international ?\r\nTu as l\'âme d\'un entrepreneur et aimerais un jour, pourquoi pas, participer à la création d\'une entité Skilld à l\'étranger ?\r\nSi tu te retrouves dans l\'un ou plusieurs de ces points, n\'hésite pas à nous envoyer ton C.V et à venir nous rencontrer pour voir comment construire ensemble une collaboration fructueuse.\r\n\r\n \r\nCOMPÉTENCES SOUHAITÉES\r\nL\'envie d\'apprendre et de continuer d\'apprendre toujours et toujours !\r\nOrganisation et méthode, capacité d\'analyse\r\nBonne communication écrite & orale.\r\nBon relationnel, rigueur, travail en équipe, bon relationnel client\r\nBon niveau d\'Anglais\r\nDe bonnes connaissances techniques seraient un plus apprécié\r\nCMS Drupal , PHP/Symfony, SQL, JavaScript, HTML5, CSS3', NULL, 'role/hr-manager@skilld.cloud', 1, '2020-12-23 16:23:04', '2020-11-23 16:23:04', '2020-11-23 16:23:04', 'Préparez CV et lettre de motivation à envoyer à role/hr-manager@skilld.cloud', 'Chef de projet technique'),
(6, 1, 'CDI', 'Agence Startup : WEB & SEO', 'agence_start_up.jpg', 'https://www.start-up.fr', 'France', 'Fougères Bretagne', 'L\'agence Startup a besoin d\'un Webdesigner :\r\n\r\nMission Globale\r\n\r\nParticiper à la création de sites web (CMS), de la partie graphique et ergonomique jusqu\'au développement Front-End.\r\nWebDesign, UI, UX\r\nDéveloppement Front end, (Html, CSS (Sass), JS (jQuery))\r\n\r\nCes missions ne sont pas exhaustives et pourront évoluer dans le temps.\r\n\r\n\r\nLe POSTE plus en détail :\r\n\r\nConcevoir des maquettes web et mobile au travers des logiciels de conception graphique tels que : Sketch, Adobe XD, Figma...\r\nDévelopper le code qui forme le front end de la solution à partir des maquettes en respectant les standards web : norme W3C, normes d\'accessibilité, Responsive Web Design...\r\nIntégrer des maquettes à des campagnes d\'emailing (HTML),\r\nGarantir la maintenabilité et la performance dans le temps (code propre, organisé et réutilisable),\r\nEffectuer des maintenances correctives et évolutives,\r\nParticiper à l\'optimisation des performances, Tenir les engagements en termes de planning et de qualité de livrables\r\n\r\n\r\nLes QUALITÉS suivantes sont primordiales :\r\n\r\nMaîtrise des :\r\nLogiciels de conception graphique web, tels que Sketch, Adobe XD, Figma...;\r\nLogiciels pour l\'intégration des maquettes de sites web tels que Zeplin, inVision...\r\nLangages : HTML 5 / CSS 3 (Sass) / JS (jQuery)\r\nCMS WordPress;\r\n\r\nCompétences dans l\'utilisation de :\r\nOutils d\'automatisation des tâches tels que Prépros, Gulp ;\r\nConnaissances des pratiques SEO.\r\n\r\n\r\nC\'est un plus si vous avez des connaissances sur :\r\n\r\nLogiciels Adobe InDesign, Photoshop, Illustrator...\r\nGit & Github\r\nFramework & thèmes Genesis (WP)\r\nChamps ACF\r\n\r\n\r\nQuelques bonnes raisons de rejoindre l\'équipe :\r\n\r\nEntreprise libérée, nous encourageons au quotidien nos collaborateurs à travailler en autonomie pour gérer leurs tâches et organiser leur temps de travail. En relation directe avec notre cheffe de projet, le planning est organisé suivant la méthode Scrum en tenant compte de vos objectifs et de ceux du client. Notre équipe est composée de professionnels passionnés du web : dynamisme et bonne humeur sont de rigueur !\r\n\r\nType de contrat : CDI (période d\'essai 3 mois)\r\nDate de début : 01/01/2021\r\nLocalisation : Fougères (à 25 minutes de Rennes)\r\n\r\n\r\nPour postuler à cette offre,\r\nEnvoyez-nous par mail :\r\n\r\nQuelques lignes sur votre motivation\r\nQuelques exemples de réalisations\r\nVotre parcours (CV)\r\n\r\nConsultez notre offre : https://www.start-up.fr/contact/rejoindre-l-equipe/startup-recrute-une-webdesigner/', NULL, 'recrutement@start-up.fr', 1, '2020-12-24 16:30:54', '2020-11-24 16:30:54', '2020-11-24 16:30:54', 'Préparez CV et lettre de motivation à envoyer à recrutement@start-up.fr', 'Webdesigner (h-f)'),
(7, 1, 'CDD', 'Monsieur SLOOP', 'mr_sloop.png', 'https://monsieursloop.com', 'France', 'Paris', '· Un(e) personne débrouillard(e), malin(e) et organisé(e) dotée d\'un bon sens logique.\r\n· Un(e) passionné(e) de design d\'interfaces.\r\n· Expérimentée (au moins 3 ans d\'expérience pro : agence, freelance ou annonceur) et aimant le travail en équipe.\r\n· Maitrise de Sketch, Xd, Photoshop, Illustrator.\r\n· L\'utilisation d\'InVision et d\'After effect est un plus.\r\n· Et évidemment, sympathique.\r\n\r\nMissions :\r\n· Vous participez aux briefs créatifs et aux AO clients.\r\n· Vous créez des interfaces et des parcours sur tous supports digitaux.\r\n· Vous êtes capables de traduire les besoins UX en interfaces fonctionnelles et\r\nesthétiques.', NULL, 'fg@agencesloop.com', 1, '2020-12-22 16:35:11', '2020-11-22 16:35:11', '2020-11-22 16:35:11', 'Préparez CV et lettre de motivation à envoyer à fg@agencesloop.com', 'Ui designer'),
(8, 1, 'CDD', 'Margy Consultants', 'margy_consult.png', 'http://www.margyconsultants.com/', 'France', 'Paris Ile de France', 'Nous recherchons un graphiste web et print dans le cadre d\'un contrat en CDD pouvant débouché sur un CDI.\r\n\r\nPlutôt polyvalent, vous avez un profil créa/exe et une double casquette print et web.Vous assurez en binôme la gestion, la vérification, la préparation ainsi que l\'exécution technique des fichiers print.Vous assurez, la création d\'un site web de la conception à la mise en ligne en passant par la maintenance.\r\nUne connaissance en web marketing.\r\n\r\nVous aurez à faire preuve de rapidité et de grande rigueur, afin de pouvoir apporter des solutions techniques aux problématiques de l\'entreprise.\r\n\r\nMission:\r\n- mise en page de support de communication : rapport d\'activité, agenda, calendrier, plaquette, magasine\r\n- création de site web, maquettage, intégration\r\n- création et envoi de mailing/newsletter\r\n- retouche/création de photos et de logos\r\n- accueil clientèle/ gestion de projet\r\n- animation des réseaux sociaux\r\n- veille concurrentiel\r\n- maitrise des outils de référencement ( analytics, semrush..)\r\n\r\nCompétences requises :\r\n- Etudiant(e) Bac +2 +3 en école de graphisme, ou autodidacte si excellente maitrise- Maîtrise des langages html et css (PHP/jquery serait un plus)\r\n- Maîtrise de wordpress et prestashop\r\n- Avoir des connaissances développement serait un plus- Une bonne maîtrise des logiciels de graphisme (Photoshop / in design/ Illustrator)\r\n- Capacité à faire des mises en pages complexes\r\n- Avoir des connaissances de la photographie est un plus! Notamment pour l\'usage et l\'exploitation de notre studio photo en interne (studio de photo scanCube)\r\n- Bon relationnel avec les clients et fournisseurs- Langue anglais si possible', NULL, 'emploi@margyconsultants.com', 1, '2020-12-19 16:38:12', '2020-11-19 16:38:12', '2020-11-19 16:38:12', 'Préparez CV et lettre de motivation à envoyer à emploi@margyconsultants.com', 'Graphiste web & print'),
(9, 3, 'Stage', 'idee animation anniversaire', 'idee-animation-paris-logo.png', 'http://idee-animation-anniversaire.fr/', 'France', 'Sucy-en-brie', 'Vos missions seront :\r\n- Rédaction de contenu pour le site web vous avez le goût de l\'écriture, article de blog, descriptif de site, rédaction SEO.\r\n- création et Intégrer du contenu de mon site sur WORDPRESS\r\n- faire des backlinks (création d\'une base de données de liens)\r\n- faire de la prospection (création d\'une base de données de prospects + envoie des mails)\r\nPour mener a bien vos missions nous recherchons un profil ayant des compétences dans le web.\r\n· rédaction web / Community management WordPress\r\n· Expérience similaire personnel (autodidacte)\r\nVous avez une bonne connaissance des réseaux sociaux (instagram,facebook,twiiter) et de la conception de posts sociaux à la création d\'infographies,\r\nÊtes une :\r\nSi vous êtes doté(e) d\'une très bonne plume, que votre curiosité et votre esprit créatif vous permettent d\'être à l\'aise sur divers sujets et supports, et que votre orthographe et votre grammaire sont irréprochables, alors vous êtes peut-être celui ou celle que nous recherchons.\r\n-force de proposition (idées de contenus, de créations graphiques...)\r\n-Des connaissances en SEO (référencement) seraient un plus\r\n-Orthographe et grammaire irréprochables.\r\n-Réactivité.', NULL, 'ideeanimationanniversaire@hotmail.com', 1, '2020-12-15 16:39:56', '2020-11-15 16:39:56', '2020-11-15 16:39:56', 'Préparez CV et lettre de motivation à envoyer à ideeanimationanniversaire@hotmail.com', 'Rédacteur web seo / intégrateur wordpress'),
(10, 3, 'Stage', 'Magicien close up mentaliste', 'faute_de_grives_600x600.png', 'https://www.magicien-close-up-mentaliste.fr/', 'France', 'Paris Ile de France', 'Magicien close up mentaliste recherche avant tout quelqu\'un d\'astucieux qui saura être autonome et force de proposition. Nous vous formerons si besoin au SEO et à l\'intégration Web sur le CMS WordPress. Votre passion pour le web et votre goût du travail bien fait vous permettent d\'évoluer rapidement sur ce type de poste. Théoriquement il faut que cette personnes possède des connaissances en HTML afin d\'être autonome et soit attiré par le digital et le monde de l\'écriture.\r\nPrincipales responsabilités :\r\nRédaction SEO + Intégration contenu sur WordPress + Mise en ligne des articles (CMS)\r\nMise en place d\'une stratégie de Backliking par rapport à une base de données cliente.\r\nRecherche et contacts avec de nouveaux partenaires.\r\nBonnes qualités rédactionnelles et orthographe irréprochable\r\nAnalyser et mettre en place une stratégie SEO\r\nRechercher des mots-clés pertinents pour les sites internet\r\nRédiger des contenus web optimisés SEO et intégrer des contenus pertinents\r\nAnalyser et améliorer positionnement des sites', NULL, 'contact@magicien-close-up-mentaliste.fr', 1, '2020-12-22 16:41:28', '2020-11-22 16:41:28', '2020-11-22 16:41:28', 'Préparez CV et lettre de motivation à envoyer à contact@magicien-close-up-mentaliste.fr', 'Redacteur web wordpress'),
(11, 3, 'CDI', 'E-Media-Concept', 'faute_de_grives_600x600', '', 'France', 'Mulhouse Alsace', 'Mission\r\nNous comptons sur vous pour animer nos communautés et les développer ; vous imaginez des contenus que vous publiez de manière optimale afin de développer l\'engagement des fans de Guide-Piscine et de M-Habitat.\r\nLes gens vont adorer vos posts et nos marques bénéficieront d\'une image et d\'une notoriété incomparable.\r\n\r\nProfil\r\nPour ce poste, nous cherchons quelqu\'un de bien particulier ; quelqu\'un qui se sent en affinité avec l\'univers de l\'habitat et de la piscine et qui est très à l\'aise dans son rôle de community manager.\r\nVous êtes donc un professionnel passionné par la communication digitale. Vous êtes à l\'aise techniquement sur les principaux réseaux : Pinterest, Facebook, Instagram, Linkedin et Twitter. Vous avez plein d\'idées de de contenus à développer ! Vous êtes dans une démarche constante d\'amélioration : vous allez tester et re-tester.\r\n\r\nUn peu d\'expérience nous semble indispensable ; la rédaction fait déjà partie de vos tâches quotidiennes. Une excellente maîtrise des réseaux sociaux dans un cadre professionnel est un minimum : vous publiez vite, juste et bien !\r\n\r\n\r\nSi on devait dessiner notre mouton à 5 pattes, il/elle serait comme ça :\r\nExpérience réussie dans la gestion des réseaux sociaux et de communautés.\r\nJolie plume, punchy, orthographe et grammaire impeccables\r\nAu cœur des tendances : vous mettez en place une veille qui vous permet de précéder les tendances et d\'engager votre communauté.\r\nOrganisé(e) et fiable ; les stats, les tests rigoureux, la gestion de projet, tout ça, ça ne vous fait pas peur.\r\nDébrouillard(e), autonome, enthousiaste... mais humble malgré cette avalanche de dons !', NULL, 'jmh@jds.fr', 1, '2020-12-19 16:43:53', '2020-11-19 16:43:53', '2020-11-19 16:43:53', 'Préparez CV et lettre de motivation à envoyer à jmh@jds.fr', 'Rédacteur Web'),
(12, 3, 'Stage', 'magicien paris steve mind', 'steve_mind.png', 'https://www.stevemindmagicien.fr/', 'France', 'Paris Ile de France', 'Votre profil :\r\n\r\nNous recherchons un(e) candidat(e)s au profil mixte : BAC + 2 minimum en rédaction web / Community management... ou expérience personnelle similaire.\r\n\r\nBonne connaissance des réseaux sociaux\r\nForce de proposition (idées de contenus, de créations graphiques...)\r\nVous êtes curieux/euse de notre marché, de ce qui s\'y passe, des différentes évolutions techniques des moteurs de recherche et réseaux sociaux\r\nDes connaissances en SEO seraient un plus', NULL, 'contact@stevemindmagicien.fr', 1, '2020-12-12 16:43:53', '2020-11-12 16:43:53', '2020-11-12 16:43:53', 'Préparez CV et lettre de motivation à envoyer à contact@stevemindmagicien.fr', 'Redacteur web'),
(13, 4, 'CDD', 'Michael Page', 'michael_page.png', 'https://www.michaelpage.fr/', 'France', 'Annecy Auvergne', 'A ce titre, vos missions seront les suivantes en tant Chef de projet réseaux IT :\r\n- Vous êtes l\'interface privilégiée avec les partenaires externes\r\n- Vous suivez et piloter les réseaux WAN/LANLSD-WAN\r\n- Vous configurez les équipements concernés,\r\n- Vous êtes le garant de la performance du réseau et êtes en mesure de traiter les anomalies,\r\n- Vous assurez la relation avec les différents fournisseurs et suivez les anomalies au quotidien,\r\n- Enfin, vous contribuez à l\'amélioration du service et du réseau .\r\nCette liste n\'est pas limitative.\r\n\r\nTitulaire d\'un diplôme type Bac+2 minimum en informatique, vous justifiez d\'au moins 2 ans d\'expérience dans une fonction similaire en tant que chef de projet réseau ou Administrateur système et réseaux.\r\nVotre expertise technique sur les réseaux LAN/ WAN/SD-WAN,\r\nCommutation (niveau 2) et routage (niveau 3) environnement Ethernet-TCP/IP, Wifi, QOS\r\nVotre niveau d\'anglais est bon.\r\nQualités de communication, force de proposition, gestion des priorités, résistance au stress, qualités pédagogiques, curiosité, pragmatisme, sens de l\'analyse pour réussir sur ce poste.\r\nRéférence : 674045', NULL, 'alizegridel@michaelpage.fr', 1, '2020-12-23 16:49:23', '2020-11-23 16:49:23', '2020-11-23 16:49:23', 'Préparez CV et lettre de motivation à envoyer à alizegridel@michaelpage.fr\r\n', 'Chef de projet réseaux it'),
(14, 4, 'CDI', 'Sportnco', 'logo_sportnco_good.png', 'https://www.sportnco.com/en/', 'France', 'Labège Midi-Pyrénées', 'Nous recrutons notre nouveau Responsable d\'exploitation en CDI pour notre site de Labège (Toulouse).\r\n\r\nVotre rôle principal sera d\'assurer le maintien en conditions opérationnelles de notre infrastructure (espace de développement, de recette, de pré-production, de production...).\r\n\r\nVous managerez votre équipe composée de deux administrateurs systèmes et gérerez les astreintes avec la Direction.\r\n\r\nVous avez un rôle important au niveau de la production. Vous êtes le garant de l\'évolution et de l\'optimisation des infrastructures de production.\r\n\r\nVous travaillez en étroite collaboration avec votre équipe, notre CTO, nos Lead Developers et nos Scrum Masters.\r\n\r\nVous guiderez votre équipe et interviendrez dans les missions suivantes :\r\n\r\n* administrer une quinzaine de plateformes de paris sportifs ;\r\n\r\n* organiser, superviser et manager l\'ensemble de la production (180 serveurs) ;\r\n\r\n* assurer le bon fonctionnement technique des applications en production (métiers ou transverses)\r\n\r\n* assurer la sauvegarde et l\'archivage des données produites ;\r\n\r\n* être garant du respect des exigences techniques et de sécurité des différents régulateurs du marché (ANJ, DGOJ...) ;\r\n\r\n* gérer le suivi des audits de sécurité ;\r\n\r\n* mettre en place des indicateurs et alertings (métrologie : performances, consommation serveurs...) ;\r\n\r\n* gérer la résolution des incidents de production (diagnostic, résolution, reprise, information aux différents services internes et à la Direction) ;\r\n\r\n* assurer une veille technologique afin de proposer des évolutions techniques ;\r\n\r\n* s\'assurer que la documentation et les procédures sont mises à jour, conformes aux normes en vigueur ;\r\n\r\n* mener les réflexions et mettre en place des process IT production et des normes;\r\n\r\n* évaluer le coût des projets, définir le planning et effectuer le reporting ;\r\n\r\n* industrialiser la production ;\r\n\r\n* gérer toute l\'informatique interne (équipement, logiciels, réseaux, ...)\r\n\r\n???? Notre environnement technique et idéalement le vôtre :\r\n\r\n* Apache2, NGINX, HAProxy, MySQL, PHP\r\n\r\n* Puppet, Capistrano\r\n\r\n* Nagios, Cacti, ELK, Grafana\r\n\r\n* Proxmox\r\n\r\n* Debian, Ubuntu\r\n\r\n* Git (Gitlab)\r\n\r\n* OpenVPN\r\n\r\n\r\nDescription du profil\r\n\r\nDe formation informatique, vous avez au moins 7 ans d\'expérience en administration système et réseaux, le monde de l\'Open Source vous passionne. Vous avez une première expérience en tant que Responsable de production / Responsable d\'exploitation.\r\n\r\n✔️CE QU\'ON ATTEND DE VOUS :\r\n\r\n* Communicant auprès de votre équipe et de la DSI\r\n\r\n* Rigoureux : vos actions peuvent impacter la production si elles sont mal faites\r\n\r\n* Autonome et proactif : vous n\'avez pas peur de prendre des initiatives\r\n\r\n* Touche-à-tout : vous pouvez intervenir sur tout la chaîne de production\r\n\r\n* Esprit d\'équipe : vous valorisez le collectif à l\'individuel et savez susciter la motivation\r\n\r\n* Sens client et qualité de delivery sont un sujet essentiel pour vous\r\n\r\n* Vous pouvez utiliser l\'anglais technique dans votre quotidien\r\n\r\n❗️ FAITES DEMI-TOUR SI :\r\n\r\n* Vous ne connaissez que l\'environnement Microsoft\r\n\r\n❤️ VOUS ÊTES FAIT POUR CE POSTE SI :\r\n\r\n* Vous êtes passionné par l\'environnement Open-source\r\n\r\n* Vous aimez les challenges et avez envie d\'évoluer dans le domaine passionnant et très dynamique du live et du sport\r\n\r\n\r\n\r\nInformations complémentaires :\r\n\r\n????CDI 35h\r\n\r\n???? Début : Janvier 2021\r\n\r\n???? Labège (31)\r\n\r\n???? Salaire : à négocier selon profil\r\n\r\nEnvie de rejoindre l\'aventure Sportnco ? Postulez ici !\r\n\r\nNotre Recruteuse, Julie, prendra contact avec vous rapidement.', NULL, 'https://taleez.com/apply/7cdlq9/applying?utm_source=Alsacreations', 1, '2020-12-19 16:49:23', '2020-11-19 16:49:23', '2020-11-19 16:49:23', 'Pour postuler, rendez-vous sur https://taleez.com/apply/7cdlq9/applying?utm_source=Alsacreations', 'Responsable d\'exploitation (systèmes et réseaux)'),
(15, 4, 'CDD', 'Page Personnel', 'page_personnel.jpg', 'https://www.pagepersonnel.fr', 'France', 'Gentilly Ile de France', 'En tant qu\'Administrateur Système et Réseau Junior, vous êtes rattaché au Responsable d\'Exploitation et vos missions sont les suivantes :\r\n\r\n- Supervision et résolution des incidents de production,\r\n- Assistance matérielle et/ou logicielle auprès des utilisateurs,\r\n- Installation et paramétrage du matériel : Serveurs, postes informatiques, équipements réseau, périphériques,\r\n- Maintien des machines à un bon niveau de fonctionnement et de sécurité,\r\n- Mise à jour des postes, serveur et éléments du réseau, suivant les préconisations de sécurité et/ou recommandation constructeur,\r\n- Gestion des sauvegardes et restaurations,\r\n- Gestion de la sécurité logique AD/SQL (création de comptes, partages),\r\n- Déploiement en production,\r\n- Gestion du réseau,\r\n- Veille technologique dans le périmètre des matériels et logiciels dont vous avez la charge.\r\n\r\nCes missions ne sont pas limitatives.\r\n\r\nEn tant qu\'Administrateur Système et Réseau Junior, vous êtes issue d\'une formation en informatique de type Bac +2 minimum et justifiez d\'une expérience d\'au moins 2 ans à un poste similaire.\r\n\r\nVous maîtrisez Windows 10 et Server (2008 à 2019), AD/DHCP/DNS, SQL Server (2008/2012), de la messagerie Exchange, et des langages de Scripting, VMware ainsi que des réseaux IP, switch, routeurs, firewalls et de l\'environnement de monitoring Nagios/Centreon.\r\nRéférence : 888757', NULL, 'nicolasconti@pagepersonnel.fr', 1, '2020-12-22 16:55:26', '2020-11-22 16:55:26', '2020-11-22 16:55:26', 'Préparez CV et lettre de motivation à envoyer à nicolasconti@pagepersonnel.fr', 'Administrateur système et réseau junior'),
(16, 4, 'CDD', 'SKILL HUNTER', 'skill_hunter.png', 'https://skillhunter.fr/', 'France', 'Paris Ile de France', 'Envie de participer à la transformation numérique d\'une banque internationale à vocation sociétale ? Vous souhaitez sortir de votre zone de confort et relever un nouveau défi ? Alors ce poste est peut-être fait pour vous !\r\n\r\nFondée en 2005, cette société à forte croissance est une organisation internationale qui conçoit et commercialise des produits et des services financiers comme des produits de crédit, d\'épargne, d\'assurance et de transferts d\'argent. En 2020, la société compte plus d\'un million de clients et cherche à devenir une banque digitale.\r\n\r\nLe grand groupe compte plusieurs filiales à l\'étranger, elle chercher à recruter pour sa holding parisien le responsable de l\'architecture d\'entreprise afin de relever les défis de leur transformation digitale ! Après une 1re expérience réussie en architecture d\'entreprise, vous souhaitez rejoindre une société internationale à taille humaine :\r\n\r\nVous travaillerez sous la responsabilité du CTO et en étroite collaboration avec la direction des Risques.', NULL, 'sara@skillhunter.fr', 1, '2020-12-23 16:55:26', '2020-11-23 16:55:26', '2020-11-23 16:55:26', 'Préparez CV et lettre de motivation à envoyer à sara@skillhunter.fr', 'Responsable de sécurité du système d\'information h/f'),
(17, 3, 'Test', 'TEST', 'C:\\xampp\\tmp\\php31FA.tmp', 'www.test.com', 'France', 'Niort', 'Oulah ma bonne dame', 'f3123c6a5377f22afa780ee93c1dcb8cefbe163dbd9c9bc80bb74a88e51192cb', 'arteptyroth@gmail.com', 1, '2020-12-26 20:52:00', '2020-11-26 20:52:00', '2020-11-26 20:52:00', 'cv et lettre TEST', 'Test'),
(18, 3, 'Test2', 'TEST 2', 'chippy-5fc00fa175f12.jpeg', 'www.tes2t.com', 'France', 'NIORT', 'Toujours pas', '4e953fd5c42b21d773b6bd564522ff540d959f20b8dd70303aded7199bf79376', 'arteptyroth@gmail.com', 1, '2020-12-26 21:27:13', '2020-11-26 21:27:13', '2020-11-26 21:27:13', 'Alors ça...', 'Test2');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(1, 'arthurpenigaud@gmail.com', '[\"ROLE_ADMIN\"]\r\n', '$argon2id$v=19$m=65536,t=4,p=1$NG5rMU9ISGlKa2J1VVRwRg$SQq1m2JN+PmYNu2Sa25SLdoOc0A2KZTXlUhldZmUIBs', 'arthurp');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affilies`
--
ALTER TABLE `affilies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `affilies_categories`
--
ALTER TABLE `affilies_categories`
  ADD PRIMARY KEY (`affilies_id`,`categories_id`),
  ADD KEY `IDX_E84D655A144C5CF3` (`affilies_id`),
  ADD KEY `IDX_E84D655AA21214B7` (`categories_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A8936DC512469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affilies`
--
ALTER TABLE `affilies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affilies_categories`
--
ALTER TABLE `affilies_categories`
  ADD CONSTRAINT `FK_E84D655A144C5CF3` FOREIGN KEY (`affilies_id`) REFERENCES `affilies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E84D655AA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK_A8936DC512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
