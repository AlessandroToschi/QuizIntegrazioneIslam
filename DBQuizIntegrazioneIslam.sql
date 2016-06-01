-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: QuizIntegrazioneIslam
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answers` (
  `IDAnswer` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `IDQuestion` int(11) NOT NULL,
  `ChosenCount` int(11) DEFAULT '0',
  PRIMARY KEY (`IDAnswer`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answers`
--

LOCK TABLES `Answers` WRITE;
/*!40000 ALTER TABLE `Answers` DISABLE KEYS */;
INSERT INTO `Answers` VALUES (1,'Più di un milione e mezzo.',1,0),(2,'Meno di cinquantamila.',1,0),(3,'Meno di cinquecentomila.',1,1),(4,'Più di due milioni e mezzo.',1,0),(5,'Sì.',2,0),(6,'No.',2,1),(7,'Nessuna.',3,0),(8,'4.',3,0),(9,'40.',3,0),(10,'200.',3,1),(14,'Un profeta.',4,0),(15,'Il Messia.',4,1),(16,'Un eretico.',4,0),(17,'Non è riconosciuto.',4,0),(18,'\"Colui che precede\".',6,0),(19,'\"Colui che prega\".',6,1),(20,'\"Colui che comanda\".',6,0),(21,'\"Colui che guida il popolo\".',6,0),(22,'Preghiera.',7,0),(23,'Testimonianza.',7,0),(24,'Elemosina.',7,1),(25,'Matrimonio',7,0),(26,'La città sacra dell\'Islam.',8,0),(27,'Il nome arabo di Gerusalemme.',8,0),(28,'La capitale dello Stato Islamico.',8,1),(29,'La sede della principale autorità musulmana.',8,0),(33,'Per imposizione.',9,0),(34,'Per fede.',9,0),(35,'Per tradizione.',9,0),(36,'Per rispetto.',9,1),(37,'Sì, escluso il maiale.',10,1),(38,'Solo la carne halal.',10,0),(39,'No, di nessun tipo.',10,0),(40,'Sì, tutta.',10,0),(41,'Sciita.',5,0),(42,'Sunnita.',5,1);
/*!40000 ALTER TABLE `Answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorrectAnswers`
--

DROP TABLE IF EXISTS `CorrectAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CorrectAnswers` (
  `IDQuestion` int(11) NOT NULL,
  `IDAnswer` int(11) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`IDQuestion`,`IDAnswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorrectAnswers`
--

LOCK TABLES `CorrectAnswers` WRITE;
/*!40000 ALTER TABLE `CorrectAnswers` DISABLE KEYS */;
INSERT INTO `CorrectAnswers` VALUES (1,1,'L’Islam è la seconda religione più diffusa in Italia, dopo il cattolicesimo. Secondo il dossier statistico Unar-Indos 2014 il loro numero è di 1 milione e 628mila ed è in costante aumento.'),(2,6,'Solamente il 15% circa dei musulmani vive in Medio Oriente. Complessivamente l\'area del mondo col maggior numero di fedeli all\'Islam è l\'Asia meridionale e sud-orientale, con circa il 62% dei circa 1,6 miliardi di musulmani al mondo. Di contro essere medio-orientale non significa automaticamente essere musulmano. Esistono chiaramente paesi dove l\'Islam rappresenta la religione della quasi totalità della popolazione, come l\'Iran (99,7%) o l\'Afghanistan (99,8%). Per contro ci sono però anche paesi medio-orientali nei quali milioni di abitanti seguono altre religioni: in Qatar la percentuale di fedeli all\'Islam è del 77,5%, negli Emirati Arabi Uniti del 76%, ed in Libano del 59,7%.'),(3,4,'Oggi in Italia esistono solo 4 moschee ufficiali, nel senso di costruzioni fatte ad hoc, complete di minareto: Ravenna, Roma, Colle Val D\'Elsa, Segrate Milano.'),(4,14,'I musulmani considerano Gesù come uno dei più grandi messaggeri di Dio al genere umano. Credono alla sua nascita virginale, ma non alla sua crocifissione e resurrezione.'),(5,42,'I musulmani si dividono in due principali rami: sunniti e sciiti. I sunniti costituiscono tra l\'87 e il 90 per cento della popolazione complessiva di musulmani nel mondo. Gli sciiti costituiscono il restante della popolazione musulmana: tra il 10 e il 13 per cento.\rOggi tutti i musulmani del mondo – 1,6 miliardi di persone – concordano sul fatto che Allah sia l’unico dio e che Maometto sia il suo profeta. Osservano i cinque pilastri dell’islam e condividono un libro sacro, il Corano. Tuttavia, mentre i sunniti basano molto la loro pratica religiosa anche sugli atti del profeta e sui suoi insegnamenti (la sunna), gli sciiti vedono nei loro leader religiosi, gli ayatollah, un riflesso di Dio sulla Terra.'),(6,18,'L’imam è colui che viene scelto all’interno di una comunità di fedeli musulmani per guidare la preghiera nelle moschee. Può essere un qualunque fedele conoscitore del rituale e non implica alcun concetto di ordini sacri. Non rappresenta una figura intermediaria tra l’uomo e Dio (come, ad esempio, il sacerdote cattolico) e non esercita alcun poter sui fedeli.'),(7,25,'L’Islam si basa su cinque principi:\\n1.	Testimoniare che non esiste divinità all’infuori di Dio (Allah), e che Muhammad è il Suo profeta.\\n2.	L’esecuzione della preghiera (quotidiana).\\n3.	Il digiuno del mese di Ramadan.\\n4.	Il pagamento della zakat obbligatorio (l’elemosina).\\n5.	L’esecuzione del Hajj (il pellegrinaggio alla Mecca).'),(8,26,'La Mecca è una città dell\'Arabia Saudita occidentale, situata nella regione dell\'Hegiaz. Capoluogo della provincia omonima, è per antonomasia la città santa (prima ancora di Medina e Gerusalemme) per i musulmani. È la città in cui è nato il profeta Maometto, ricordato come rifondatore dell\'Islam. Contiene la più grande moschea del mondo, il Masjid al-Haram.'),(9,34,'Il pregiudizio più grande che l’Occidente ha verso la cultura islamica è quello del velo, che riteniamo il simbolo della sottomissione della donna all\'uomo e della sua mancanza di diritti.\rIn realtà l’utilizzo del velo è una dimostrazione di fede che le donne scelgono di compiere. È vero che in alcuni paesi musulmani il suo utilizzo è imposto, ma ciò avviene a causa di particolari avvenimenti storici e politici. In molti paesi alle donne viene lasciata assoluta libertà di scelta in tema di abbigliamento.'),(10,38,'Halal significa letteralmente “permesso”. Alcune carni specifiche sono considerate come haram (vietate), ad esempio il maiale e i suoi derivati. Altre carni, invece, sono halal solo se macellate secondi certi principi di macellazione: deve essere garantito il benessere degli animali; gli animali devono essere vivi presso il macello; i macellai musulmani devono pronunciare il nome di Dio prima della macellazione; la macellazione deve essere eseguita nella maniera più compassionevole possibile; il sangue deve essere adeguatamente eliminato dalla carcassa.');
/*!40000 ALTER TABLE `CorrectAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `IDQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`IDQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (1,'Quanti sono i musulmani in Italia?'),(2,'Musulmano è sinonimo di arabo?'),(3,'Quante sono le moschee ufficialmente riconosciute in Italia?'),(4,'Per l’Islam Gesù è:'),(5,'La popolazione musulmana è in maggioranza sunnita o sciita?'),(6,'L’imam è:'),(7,'Quale di questi non è uno dei cinque pilastri dell’Islam:'),(8,'Cos’è la Mecca?'),(9,'Perché le donne musulmane portano il velo?'),(10,'I musulmani possono mangiare la carne?');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-31 21:08:56
