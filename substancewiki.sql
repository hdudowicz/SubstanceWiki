-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2018 at 03:42 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `substancewiki`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `effects`
--

CREATE TABLE `effects` (
  `EffectID` int(10) NOT NULL,
  `EffectName` varchar(100) DEFAULT NULL,
  `EffectType` varchar(100) DEFAULT NULL,
  `EffectDescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `effects`
--

INSERT INTO `effects` (`EffectID`, `EffectName`, `EffectType`, `EffectDescription`) VALUES
(1, 'Analysis enhancement', 'Cognitive', 'Analysis enhancement is a perceived improvement of a person\'s overall ability to logically process i'),
(2, 'Anxiety', 'Cognitive', 'Anxiety is the experience of negative feelings of apprehension, worry, and general unease.[6] These '),
(3, 'Creativity enhancement', 'Cognitive', 'Creativity enhancement is a perceived increase in one\'s capability to imagine new ideas, create art,'),
(4, 'Dream potentiation', 'Cognitive', 'Dream potentiation is an effect which increases the subjective intensity, vividness, and frequency o'),
(5, 'Ego inflation', 'Cognitive', 'Ego inflation is an effect that magnifies and enhances one\'s own ego and self-regard in a manner whi'),
(6, 'Emotion enhancement', 'Cognitive', 'Emotion enhancement is an effect which greatly amplifies and enhances a person\'s current emotional s'),
(7, 'Empathy, affection, and sociability enhancement', 'Cognitive', 'Empathy, affection, and sociability enhancement is the experience of a mind state which is dominated'),
(8, 'Focus enhancement', 'Cognitive', 'Focus enhancement is the experience of an increased ability to selectively concentrate on an aspect '),
(9, 'Immersion enhancement', 'Cognitive', 'Immersion enhancement is an effect which results in a pronounced increase in one\'s tendency to becom'),
(10, 'Increased music appreciation', 'Cognitive', 'Increased music appreciation is a general sense of an increased enjoyment of music. When music is li'),
(11, 'Increased sense of humor', 'Cognitive', 'Increased sense of humor is a general enhancement of the likelihood and degree to which a person fin'),
(12, 'Irritability', 'Cognitive', 'Irritability is the pervasive and sustained emotional state of being easily annoyed and provoked to '),
(13, 'Memory enhancement', 'Cognitive', 'Memory enhancement is an improvement in a person\'s ability to recall or retain memories.[80][81][82]'),
(14, 'Motivation enhancement', 'Cognitive', 'Motivation enhancement is an increased desire to perform tasks and accomplish goals in a productive '),
(15, 'Novelty enhancement', 'Cognitive', 'Novelty enhancement is a feeling of increased fascination[101], awe,[101][102][103] and appreciation'),
(16, 'Personal meaning enhancement', 'Cognitive', 'Personal meaning enhancement (also known as aberrant salience) is the experience of a considerably i'),
(17, 'Suggestibility enhancement', 'Cognitive', 'Suggestibility enhancement is an increased tendency to accept and act on the ideas or attitudes of o'),
(18, 'Thought acceleration', 'Cognitive', 'Thought acceleration (also known as racing thoughts)[119] is the experience of thought processes bei'),
(19, 'Thought connectivity', 'Cognitive', 'Thought connectivity is an alteration of a person\'s thought stream which is characterized by a disti'),
(20, 'Thought organization', 'Cognitive', 'Thought organization (also known as fluid intelligence)[126] is a state of mind in which one\'s abili'),
(21, 'Wakefulness', 'Cognitive', 'Wakefulness is an increased ability to stay conscious without feeling sleepy combined with a decreas'),
(22, 'Amnesia', 'Cognitive', 'Amnesia is a global impairment in the ability to acquire new memories regardless of sensory modality'),
(23, 'Analysis suppression', 'Cognitive', 'Analysis suppression is a distinct decrease in a person\'s overall ability to process information[157'),
(24, 'Anxiety suppression', 'Cognitive', 'Anxiety suppression (also known as anxiolysis or minimal sedation)[163] is a partial to complete sup'),
(25, 'Cognitive fatigue', 'Cognitive', 'Cognitive fatigue (also called exhaustion, tiredness, lethargy, languidness, languor, lassitude, and'),
(26, 'Confusion', 'Cognitive', 'Confusion is an impairment of abstract thinking demonstrated by an inability to think with one’s cus'),
(27, 'Creativity suppression', 'Cognitive', 'Creativity suppression is a decrease in both a person\'s motivation and capabilities when performing '),
(28, 'Delirium', 'Cognitive', 'Confusion is an impairment of abstract thinking demonstrated by an inability to think with one’s cus'),
(29, 'Disinhibition', 'Cognitive', 'Disinhibition is an orientation towards immediate gratification, leading to impulsive behavior drive'),
(30, 'h', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `substances`
--

CREATE TABLE `substances` (
  `SubstanceID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `SubstanceName` text NOT NULL,
  `SubstanceDescription` text NOT NULL,
  `SubstancePharm` text NOT NULL,
  `SubstanceChemistry` text NOT NULL,
  `LowDoseRange` text NOT NULL,
  `MediumDoseRange` text NOT NULL,
  `HighDoseRange` text NOT NULL,
  `StructureImageName` text NOT NULL,
  `PhysicalEffects` varchar(100) DEFAULT NULL,
  `CognitiveEffects` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `substances`
--

INSERT INTO `substances` (`SubstanceID`, `ClassID`, `SubstanceName`, `SubstanceDescription`, `SubstancePharm`, `SubstanceChemistry`, `LowDoseRange`, `MediumDoseRange`, `HighDoseRange`, `StructureImageName`, `PhysicalEffects`, `CognitiveEffects`) VALUES
(1, 1, 'DMT', 'N,N-Dimethyltryptamine (also known as DMT and \"The Spirit Molecule\") is a naturally-occurring psychedelic substance of the tryptamine class that produces uniquely powerful and short-lived psychedelic effects when administered.[1]\n\nDepending on the dosage and method of administration, the effects of DMT can range from mild psychedelic states to powerfully immersive life-altering experiences which are often described as the ultimate displacement from ordinary consciousness in which users are placed in a subjective state where they can experience exploring ineffable spiritual realms or alternate dimensions.[2]\n\nDMT is present in over 65 species of plants and has been identified as being a normal constituent of human metabolism and an endogenous neurotransmitter in certain rodents. Its presence is also known to be widespread throughout the plant kingdom.[3][4] Although various theories have been postulated, its neurobiological function has yet to be determined.[citation needed]\n\nIn modern times, DMT is known as an extremely powerful visionary psychedelic entheogen that, when vaporized or smoked, produces short-lived effects with a very rapid onset that is sometimes described as an \"impossibly high-speed rollercoaster ride.\" When ingested in combination with a MAOI or RIMA agent, it becomes active orally and significantly longer lasting, immersive, and interactive in nature: this combination is known as ayahuasca.[5] Ayahuasca brews have been used traditionally in South America since at least around the year 1500.[6]\n\nUnlike most highly prohibited substances, DMT is not considered to be addictive or toxic by the scientific community.[7][8] Nevertheless, unpredictable adverse reactions such as uncontrollable anxiety, delusions and psychosis can always occur, particularly among those predisposed to mental disorders.[9] While these negative reactions or \"bad trips\" can often be attributed to user inexperience or improper preparation of set and setting, they have been known to happen spontaneously among even highly experienced users as well. It is therefore highly advised to approach this incredibly powerful and unpredictable hallucinogenic substance with the proper preparation and harm reduction practices if using it.', 'DMT\'s psychedelic effects are believed to come from its efficacy at the 5-HT2A receptor as a partial agonist. However, the role of these interactions and how they result in the psychedelic experience continues to remain elusive.\n\nIn addition to this, N,N-dimethyltrytamine is believed to be an endogenous ligand for the sigma receptor. However, the significance of the sigma-1 receptor remains the subject of ongoing scientific research.[21]\n\nThe compound\'s affinities for various receptor sets have been well-studied and are listed in the table below:', 'DMT, or N,N-dimethyltryptamine, is a naturally-occurring indole alkaloid molecule of the tryptamine class. Tryptamines share a core structure comprised of a bicyclic indole heterocycle attached at R3 to an amino group via an ethyl side chain. DMT contains two methyl groups (CH3-) bound to the terminal amine RN at the end of this chain. DMT has many homologs and analogs from base tryptamines like MET and DPT, to four and five position substituted variants such as 4-PO-DMT (Psilocybin), 4-AcO-DMT (Psilacetin), and 5-MeO-DMT.\n\n', '2-20mg', '20-40mg', '60mg+', 'DMT.svg', '1', NULL),
(2, 2, 'Cannabis', 'Cannabis (also known as marijuana,[1] weed,[2] pot,[3], grass,[4] herb,[5] and many others) is a preparation of the cannabis plant that produces psychoactive effects. The principal psychoactive constituent of cannabis is tetrahydrocannabinol (THC), which makes up one of 483 known compounds in the plant,[6] including at least 84 other cannabinoids such as cannabidiol (CBD), cannabinol (CBN), tetrahydrocannabivarin (THCV),[7][8] and cannabigerol (CBG).\n\nThe genus cannabis is indigenous to central Asia and the Indian subcontinent.[9] The earliest recorded uses of cannabis date from the 3rd millennium BC.[10] At least three species are recognized: Cannabis sativa, Cannabis indica, and Cannabis ruderalis. In modern times, cannabis is used for recreational or medicinal and religious or spiritual purposes.[citation needed]\n\nSince the early 20th century, cannabis has been subject to legal restrictions with the possession, use, and sale of cannabis preparations containing psychoactive cannabinoids currently illegal in most countries of the world. According to a United Nations report, cannabis is the most used illicit drug in the world.[11][12] In 2004, the U.N. estimated that global consumption patterns of cannabis indicated that approximately 4% of the adult world population (162 million people) used cannabis annually and that approximately 0.6% (22.5 million) of people used cannabis daily.[13]\n\n', 'The most psychoactive cannabinoid found in the cannabis plant is tetrahydrocannabinol (or delta-9-tetrahydrocannabinol), commonly known as THC.[18] Other cannabinoids include delta-8-tetrahydrocannabinol, cannabidiol (CBD), cannabinol (CBN), cannabicyclol (CBL), cannabichromene (CBC) and cannabigerol (CBG); they have less psychotropic effects than THC, but may play a role in the overall effect of cannabis.[19] The most studied are THC, CBD and CBN.[20] The entourage effect is a proposed mechanism by which compounds present in cannabis which are largely non-psychoactive by themselves modulate the overall psychoactive effects of the plant (these resulting principally from the action of the main psychoactive component of cannabis, tetrahydrocannabinol (THC)).\n\nTHC appears to alter mood and cognition through its agonist actions on the CB1 receptors, which inhibit a secondary messenger system (adenylate cyclase) in a dose dependent manner. Via CB1 activation, THC indirectly increases dopamine release and produces psychotropic effects. Cannabidiol acts as an allosteric modulator of the mu and delta opioid receptors.[21] THC also potentiates the effects of the glycine receptors.[22] However, the role of these interactions and how they result in the cannabis high remains subject to on-going scientific investigation.', 'Cannabis plants contain a number of different specific compounds at various ratios. Cannabis contains more than 460 compounds;[14] at least 80 of these are cannabinoids,[15][16] chemical compounds that interact with cannabinoid receptors in the brain.[17] The most common of these are listed below:\n\nOthers\nCBN (Cannabinol)\nCBG (Cannabigerol)\nCBC (Cannabichromene)\nCBL (Cannabicyclol)\nCBV (Cannabivarin)\nTHCV (Tetrahydrocannabivarin)\nCBDV (Cannabidivarin)\nCBCV (Cannabichromevarin)\nCBGV (Cannabigerovarin)\nCBGM (Cannabigerol Monomethyl Ether)', '25-66mg', '66-150mg', '150mg+', 'cannabis.png', '1', NULL),
(3, 3, 'Amphetamine', 'Amphetamine (also known as alpha-methylphenethylamine and speed) is a stimulant substance of the phenethylamine class. It is the parent compound of the substituted amphetamines, a group which includes a diverse range of substances like bupropion, phenmetrazine, MDMA, and DOx. Amphetamine acts primarily by enhancing the activity of the neurotransmitters dopamine and norepinephrine in the brain.[citation needed]\n\nAmphetamine was first synthesized in 1887.[citation needed] In the 1930s, it began to be marketed and sold over-the-counter under the name Benzedrine. It was widely used to treat a wide range of ailments such as alcohol hangover, narcolepsy, depression, and weight reduction.[1] Today, amphetamine is prescribed for the treatment of attention deficit hyperactivity disorder (ADHD), narcolepsy, and obesity.[2][3] Additionally, it sees widespread illicit use as a performance enhancing agent and recreational substance.\n\nAmphetamine is viewed as one of the benchmark members of the stimulant class. Characteristic effects include stimulation, enhanced focus, increased libido, suppressed appetite, and euphoria. It is usually taken orally, but can also be insufflated, injected, or administered rectally. Lower doses are commonly reported to increase focus and productivity while higher doses tend to increase sociability, sexual desire, and euphoria.\n\nRecreational use of amphetamine is associated with dependence and abuse. It is highly advised to use harm reduction practices if using this substance.\n\n', 'Amphetamine exerts its behavioral effects by increasing the signaling activity of neurotransmitters norepinephrine and dopamine in the reward and executive function pathways of the brain. The reinforcing and motivational effects of amphetamine are mostly due to enhanced dopaminergic activity in the mesolimbic pathway.[13] The euphoric and locomotor-stimulating effects of amphetamine are dependent upon the magnitude and speed by which it increases synaptic dopamine and norepinephrine concentrations in the striatum.[14]\n\nAmphetamine is a potent full agonist of the trace amine-associated receptor 1 (TAAR1) and interacts with vesicular monoamine transporter 2 (VMAT2).[15][16][17] Combined action on TAAR1 and VMAT2 results in increased concentrations of dopamine and norepinephrine in the synapses, which stimulates neuronal activity.\n\nDextroamphetamine is a more potent agonist of TAAR1 than levoamphetamine.[18] Consequently, dextroamphetamine produces greater CNS stimulation than levoamphetamine, roughly three to four times more, but levoamphetamine has slightly stronger cardiovascular and peripheral effects.[19][20]\n\n', 'Amphetamine, also known as alpha-methylphenethylamine, is a synthetic substance of the phenethylamine family. The chemical structure of amphetamine consists of phenethylamine, a phenyl ring bound to an amino (NH2) group through an ethyl chain, with an additional methyl substitution at Rα. It can be referred to as a methyl homolog of phenethylamine as it has the same general formula, differing only in the addition of one methyl group. The name \'amphetamine\' is a contraction from αlphamethylphenethylamine\n\nAmphetamine is a chiral compound. The racemic mixture can be divided into its optical antipodes: levo- and dextro-amphetamine. Today, dextroamphetamine sulfate is the predominant form used:[citation needed] it consists entirely of the d-isomer. Attention disorders are often treated using Adderall or a generic equivalent, a formulation of mixed amphetamine salts that contain both racemic-amphetamine and d-amphetamine in the sulfate and saccharate forms mixed to a final ratio of 3 parts d-amphetamine to 1 part l-amphetamine.[citation needed]\n\nAt room temperature, the pure free base of amphetamine is a mobile, colorless, and volatile liquid with a characteristically strong amine odor, and acrid, burning taste.[12]', '5-20mg', '20-70mg', '70mg+', 'Amphetamine.svg', '1', NULL),
(4, 4, 'Kratom', 'Mitragyna speciosa (also known as kratom) is a tropical tree of the coffee family indigenous to South East Asia.[1] The leaves of M. speciosa contain various psychoactive alkaloids that produce mild stimulant and opioid effects.[1] The pharmacology of kratom is complex, although it produces its major effects through action at opioid receptors in the brain.[1]\n\nM. speciosa is indigenous to Thailand, Indonesia, Malaysia, Myanmar, and Papua New Guinea,[2] where it has been used in traditional medicines for centuries. Traditionally, fresh or dried kratom leaves are chewed or made into tea. Starting in the 2000s, kratom began to receive significant attention due to increased use in Western cultures as an alternative medicine. It is readily available for purchase from a large number of internet vendors, most commonly as dried and powdered leaves.[1]\n\nUser reports indicate that the effects of kratom vary depending on the dose used. Lower doses are reported to produce a caffeine-like stimulant effect. Higher doses produce opioid effects like pain relief, sedation, and euphoria. Many users claim kratom is useful in treating opioid addiction as a weaning agent, particularly during the initial withdrawal phase. Kratom exists in a variety of strains with different characteristics, some more opioid-like than others.\n\nKratom’s mood-elevating effects have raised concerns about the plant’s potential for dependence and abuse. In some jurisdictions, its sale and importation have been restricted, and several public health authorities have raised alerts.[3][4] Strong evidence for its claimed benefits are lacking. It is highly advised to use harm reduction practices if using this substance.', 'Kratom behaves as an opioid receptor agonist similar in function to morphine and other opiates, although its pharmacological action and subjective effects differ significantly from those of traditional opiates.[11]\n\nOpioids exert their effects by binding to and activating the opioid receptors. They structurally mimic endogenous endorphins which are naturally found within the body and also work upon the opioid receptor system. The way in which opioids structurally mimic these natural endorphins results in their euphoric, pain-relieving and anxiolytic effects. This is because endorphins are responsible for reducing pain, causing sedation, and feelings of pleasure. They can be released in response to pain, strenuous exercise, orgasm, or general excitement.\n\nMitragynine and 7-hydroxymitragynine bind as partial agonists to the μ-opioid receptors and antagonistic to the κ- and δ-opioid receptors. They have high binding affinities to the µ- and κ-receptors. The binding affinity to the δ-receptors is high for 7-hydroxymitragynine, but weak for mitragynine.[12]\n\nUnlike most other opioids, kratom also presents affinity for the κ-opioid[13], norepinephrine and serotonin[14] receptor systems where it functions as an agonist. Its action on norepinephrine and serotonin also likely contributes to kratom\'s stimulating properties.\n\nAdditionally, kratom contains alkaloids (rhynchophylline and mitraphylline) which function as NMDA receptor antagonists.[15] This may be responsible for the mild dissociating effects which occur at heavy doses.', 'The leaves of M. speciosa contain more than 40 compounds,[5] including many indole alkaloids such as mitragynine, mitraphylline, and 7-hydroxymitragynine (which is currently the most likely candidate for the primary active chemical in the plant).[6][7] Other active compounds in M. speciosa include raubasine, rhynchophylline, and corynantheidine, among many others.[8]\n\nThe amount of active alkaloids in the leaves highly depends on many factors. One major factor is the location of the tree. When trees are grown in Southeast Asia, the levels tend to be higher but when grown elsewhere (even in greenhouses) the levels tend to be low or non-existent.[9] One analysis of products marketed as kratom leaf found mitragynine at levels of 1–6% and 7-hydroxymitragynine at levels of 0.01–0.04%.[10]', '1-3grams', '3-8grams', '8grams+', 'kratom.jpg', '11', NULL),
(5, 5, 'LSD', 'Lysergic acid diethylamide (also known as Lysergide, LSD-25, LSD, L, lucy, and acid) is a semisynthetic psychedelic substance of the lysergamide class.[2] LSD is one of the most potent, well-known and widely used psychedelic substances. The pharmacology of LSD is complex, but it acts primarily by stimulating serotonin receptors in the brain.[citation needed]\n\nThe psychoactive effects of LSD were first discovered in 1943 by the Swiss chemist Albert Hofmann. In the 1950s, LSD was marketed under the trade name Delysid and used in psychotherapy and for experimental purposes.[3] LSD garnered widespread interest from clinicians and researchers and was secretly investigated by the U.S. Central Intelligence Agency (CIA) as a potential mind control agent.[4] During the mid-1960s, use of LSD spread widely in the emerging counterculture, leading to its prohibition in 1971.[5][6]\n\nFollowing a 40 year hiatus, research into LSD\'s potential therapeutic uses has been revived. LSD is currently under investigation for the treatment of a number of ailments including alcoholism, addiction, cluster headache, and anxiety associated with terminal illness.[3] LSD remains in widespread illicit use for recreational and spiritual purposes. The lifetime prevalence of LSD use among adults is in the range of 6-8%.[3]\n\nCharacteristic effects of LSD include geometric visual hallucinations, time distortion, enhanced introspection, and ego loss. LSD is commonly described by users to evoke entheogenic and mystical-type experiences that can facilitate self-reflection and personal growth. It is considered by some to be the first modern entheogen, a category which had been limited to traditional plant preparations or extracts.[7]\n\nUnlike other highly prohibited substances, LSD is not considered to be addictive or physiologically toxic.[8][9] Nevertheless, adverse psychological reactions such as severe anxiety, paranoia and psychosis are always possible, particularly among those predisposed to mental illness.[10] It is highly advised to use harm reduction practices if using this substance.', 'LSD acts as a partial agonist for the 5-HT1A, 5-HT2A, 5-HT2B, 5-HT2C and 5-HT6 receptors.[25][26] LSD binds to most serotonin receptor subtypes except for 5-HT3 and 5-HT4. 5-HT5B receptors, which have not been found in humans, also have a high affinity for LSD.[27] The psychedelic effects LSD are thought to be mediated by agonist action 5-HT2A receptors.[28]\n\nLSD also possesses efficacy at all dopamine and all norepinephrine receptors. Most serotonergic psychedelics are not significantly dopaminergic, so LSD is unique in this respect. LSD\'s agonism of D2 receptors has been shown to contribute to its psychoactive effects.[29][30]\n', 'LSD, or d-lysergic acid diethylamide, is a semisynthetic substance of the lysergamide family. LSD\'s chemical structure consists of a bicyclic hexahydroindole ring fused to a bicyclic quinoline group (lysergic acid). At carbon 8 of the quinoline an N, generally N-diethyl carboxamide is bound, LSD is additionally substituted at carbon 6 with a methyl group.\n\nLSD is a chiral compound with two stereocenters at R5 and R8. LSD, also called (+)-D-LSD, has an absolute configuration of (5R, 8R). The three other stereoisomers of LSD do not have psychoactive properties.[22]\n\nIn its pure form, LSD occurs as a colorless, odorless crystal.[citation needed] LSD is sensitive to oxygen, ultraviolet light, and chlorine (especially in solution).[23] Its potency may last for years if it is stored away from light and moisture at cold temperatures around 0°C or below, but will slowly degrade at normal room temperature (25°C).[citation needed]\n\n', '15-75ug', '75-250ug', '250ug+', 'LSD.svg', '1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `effects`
--
ALTER TABLE `effects`
  ADD PRIMARY KEY (`EffectID`);

--
-- Indexes for table `substances`
--
ALTER TABLE `substances`
  ADD PRIMARY KEY (`SubstanceID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `effects`
--
ALTER TABLE `effects`
  MODIFY `EffectID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `substances`
--
ALTER TABLE `substances`
  MODIFY `SubstanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;