-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 13 2014 г., 23:55
-- Версия сервера: 1.0.15
-- Версия PHP: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `user45572_elective`
--

-- --------------------------------------------------------

--
-- Структура таблицы `qctf_quiz`
--

CREATE TABLE IF NOT EXISTS `qctf_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Дамп данных таблицы `qctf_quiz`
--

INSERT INTO `qctf_quiz` (`id`, `data`) VALUES
(1, '{"Answer": 1, "Answers_List": ["Sex & Drugs & Rock & Roll", "42", "Пушкин", "Да"], "Question": "Ответ на главный вопрос жизни, вселенной и всего такого?"}'),
(2, '{"Answer": 3, "Answers_List": ["bo", "bu", "bh", "bt"], "Question": "Национальный домен Бутана обозначается этими двумя буквами."}'),
(3, '{"Answer": 1, "Answers_List": ["''Ben'' и ''Music & Me''", "''Thriller'' и ''Bad''", "''Off the Wall'' и ''Invincible''", "''Dangerous'' и ''HIStory''"], "Question": "Какие два альбома Майкла Джексона, ставшие одними из самых продаваемых в истории музыки, вышли в 80-е годы ?"}'),
(4, '{"Answer": 0, "Answers_List": ["2000", "1", "8", "XP"], "Question": "Для этого Windows не разрабатывался новый логотип."}'),
(5, '{"Answer": 3, "Answers_List": ["Гибридное ядро", "Модульное ядро", "Микроядро", "Монолитное ядро"], "Question": "Какое ядро использует ОС Linux?"}'),
(6, '{"Answer": 2, "Answers_List": ["Каменев", "Репин", "Васнецов", "Малевич"], "Question": "Кто автор картины \\"Саввинский монастырь под Москвой\\"?"}'),
(7, '{"Answer": 3, "Answers_List": ["На небе", "На земле", "В Доме Божьем", "У соседей"], "Question": "Где Иисус советовал собирать сокровища?"}'),
(8, '{"Answer": 0, "Answers_List": ["3 век", "2 век", "4 век", "5 век"], "Question": "В каком веке было составление полной Библии Евсевием?"}'),
(9, '{"Answer": 0, "Answers_List": ["Иерусалим", "Вифлеем", "Мекка", "Рим"], "Question": "Какой город считается священным одновременно для Иудеев, Мусульман и Христиан?"}'),
(10, '{"Answer": 2, "Answers_List": ["Салманассар", "Давид", "Навуходоносор", "Иисус Навин"], "Question": "Кто завоевал Самарию?"}'),
(11, '{"Answer": 1, "Answers_List": ["Козьма Прутков", "Герцен ", "Даль", "Толстой"], "Question": "Кто автор фразы: \\"В здании человеческого счастья дружба возводит стены,а любовь образует купол.\\"?"}'),
(12, '{"Answer": 1, "Answers_List": ["Мамре", "Авигея", "Шатёр", "Памре"], "Question": "Дубрава в которой жил Авраам? "}'),
(13, '{"Answer": 1, "Answers_List": ["Ровоам", "Соломон", "Саул", "Давид"], "Question": "О ком этот стих:   Прочь старцев добрые советы!Готов он слушать молодёжь.Права ущемлены, задеты, -Подпало царство под делёж..."}'),
(14, '{"Answer": 2, "Answers_List": ["жизни и тайны", "мусора и хлама", "чудовищ", "змей"], "Question": "\\"В жизнь нужно входить не весёлым гулякою, как в приятную рощу, а сблагоговейным трепетом, как в священный лес, полный .......\\"В.В.Вересаев (1867-1945)"}'),
(15, '{"Answer": 3, "Answers_List": ["Варак", "Иосиф", "Ваал", "Моисей"], "Question": "Кто совершил победу благодаря мужеству и бесстрашию женщины-пророчецы? "}'),
(16, '{"Answer": 3, "Answers_List": ["Разон", "Варавва", "Иоас", "Иосия"], "Question": "Кто был начальником шайки разбойников, ставший впоследствии царём Сирии?"}'),
(17, '{"Answer": 1, "Answers_List": ["ещё раньше", "его скушает", "ему не даст кричать", "не даст ему покушать"], "Question": "\\"Петух пробуждается рано; но злодей .......\\" Козьма Прутков"}'),
(18, '{"Answer": 0, "Answers_List": ["Масло", "Йогурт", "Мёд", "Сметана"], "Question": "Какой продукт питания выдавали плотникам и каменотёсам (книга Ездры)?"}'),
(19, '{"Answer": 3, "Answers_List": ["40 лет", "28 лет", "6 месяцев", "3 года"], "Question": "Соломон царствовал ..."}'),
(20, '{"Answer": 1, "Answers_List": ["отчаивается", "бьётся головой об стену", "молится", "матерится"], "Question": "\\"Верующий не боится напастей, но при невзгоде судьбы не .......\\" Козьма Прутков"}'),
(21, '{"Answer": 1, "Answers_List": ["Иессей", "Измаил", "Павел", "Пётр"], "Question": "Как звали предка Иисуса Христа? "}'),
(22, '{"Answer": 2, "Answers_List": ["Слова Божия", "соседей", "телефона", "магнитофона"], "Question": "\\"Итак вера от слышания, а слышанье от .......\\""}'),
(23, '{"Answer": 3, "Answers_List": ["Предупреждает о грехе и даёт последнюю надежду на восстановление Иудеи", "Освободительная работа Мессии. Предостереж. не вступать в союз с язычниками", "Плач о разрушении храма Вавилона", "Напоминание пленным о грехе который привёл к суду над ними. Даёт надежду"], "Question": "Какая основная тема книги Иеремии?"}'),
(24, '{"Answer": 2, "Answers_List": ["Толстой ", "Козьма Прутков", "Герцен ", "Даль"], "Question": "Кто автор фразы: \\"Любить - значит делать доброе.\\"?"}'),
(25, '{"Answer": 1, "Answers_List": ["Многострадальный пророк", "Пастух", "Законодатель, писатель", "Сборщик податей"], "Question": "Кем был Иеремия?"}'),
(26, '{"Answer": 2, "Answers_List": ["Так говорит Библия", "Так говорят люди", "Так говорят звери", "Так говорят рыбы"], "Question": "Откуда мы можем узнать, что Бог любит нас?"}'),
(27, '{"Answer": 2, "Answers_List": ["Конь", "Собака", "Олень", "Кошка"], "Question": "Домашнее животное ненадёжное \\"для спасения\\" "}'),
(28, '{"Answer": 3, "Answers_List": ["Диотреф", "Вариисус", "Евтих", "Акила"], "Question": "Как звали христианина Первоапостольской Церкви, \\"любящего первенствовать\\"?"}'),
(29, '{"Answer": 0, "Answers_List": ["сотник Корнилий", "апостол Павел", "Тимофей", "Сосфен"], "Question": "Как звать первого язычника уверовавшего во Христа?"}'),
(30, '{"Answer": 3, "Answers_List": ["Иисус Христос", "Вампир", "Донор", "Маньяк"], "Question": "Кто заплатил за нас кровью?"}'),
(31, '{"Answer": 3, "Answers_List": ["84", "80", "65", "73"], "Question": "Сколько лет было Анне пророчице, когда Иисуса принесли в храм?"}'),
(32, '{"Answer": 2, "Answers_List": ["своему сознанию", "за другими", "как овца на заклание", "за ошибками"], "Question": "\\"Дело не в том, чтобы никогда не далать ошибок, а в том, чтобы уметь сознаватьих и великодушно, смело следовать .......\\" В.Г.Белинский (1811-1848)"}'),
(33, '{"Answer": 2, "Answers_List": ["Кедорлаомер", "Мафусал", "Адониседек", "Маной"], "Question": "Как звали царя Еламского, воевавшего в числе четырёх царей против пяти царейу Мёртвого моря?"}'),
(34, '{"Answer": 3, "Answers_List": ["Непорочностью", "Ездил на мерседесе", "У него было две головы", "Он был пятиметрового роста"], "Question": "Чем отличился Ной от других людей?"}'),
(35, '{"Answer": 3, "Answers_List": ["Сделал золотого тельца для народа", "Ослушался Бога и не пошел на войну с амаликитянами", "Обманул своего брата Моисея", "Не поверил Богу"], "Question": "Какой грех сделал Аарон?"}'),
(36, '{"Answer": 0, "Answers_List": ["Абихаил", "Мардохей", "Аввакум", "Авда"], "Question": "Кто был отец Есфири?"}'),
(37, '{"Answer": 3, "Answers_List": ["Моав", "Тарс", "Кипр", "Понт"], "Question": "Откуда родом была Руфь?"}'),
(38, '{"Answer": 3, "Answers_List": ["Царь", "Пророк", "Судья", "Тысяченачальник"], "Question": "Кто был Иеровоам?"}'),
(39, '{"Answer": 3, "Answers_List": ["Бытие", "Исход", "Евангелие от Матфея", "Псалтырь"], "Question": "Как называется первая книга Библии?"}'),
(40, '{"Answer": 1, "Answers_List": ["но назовите зло злом", "лишь немного попытайте", "лучше сразу престелите", "лучше просто обругайте"], "Question": "\\"Оправдайте, не карайте, .......\\" Ф.М.Достоевский (1821-1881)"}'),
(41, '{"Answer": 2, "Answers_List": ["Море", "Лужа", "Ручеёк", "Колодец"], "Question": "Как называется большое водное пространство, угрожающее жизни моряков? "}'),
(42, '{"Answer": 3, "Answers_List": ["Статир", "Талант", "Динарий", "Сикль"], "Question": "Какую монету Петр должен был извлечь из пасти рыбы?"}'),
(43, '{"Answer": 3, "Answers_List": ["Носик", "Тарелку", "Туалет", "Купальник"], "Question": "У крошки тигрёнкаПовадки котёнкаОн моет свой .......Он ловит свой хвостик "}'),
(44, '{"Answer": 0, "Answers_List": ["Египет", "Иерусалим", "Иерихон", "Вифлеем"], "Question": "Какое из этих названий является страной? "}'),
(45, '{"Answer": 1, "Answers_List": ["Елезавета", "Мария", "Ева", "Блудница"], "Question": "Какая женщина до рождения Христа долго ждала ребёнка? "}'),
(46, '{"Answer": 0, "Answers_List": ["исцеленье", "хлебопреломленье", "убийство Петрухи", "побег"], "Question": "Первосвященнический рабОстался бы без уха,Когда мечом ПетрухаХватил, как доблестный араб.Велит убрать спаситель меч,Свершает .......Иисусово хотенье, -Чтоб мир без крови был и сеч"}'),
(47, '{"Answer": 0, "Answers_List": ["осле", "мальчике", "слоне", "щенке"], "Question": "Ликуй, Сиона дщерь, Иерусалима,Твой Царь грядёт на молодом .......С печалью сожаленья на челе:Его любовь к тебе непостижима!"}'),
(48, '{"Answer": 3, "Answers_List": ["Синодальный", "Современный", "Классический", "Священный"], "Question": "Как называется наиболее распространенный перевод Библии?"}'),
(49, '{"Answer": 0, "Answers_List": ["Самария", "Россия", "Африка", "Америка"], "Question": "Как называется страна расположенная между Иудеей и Галилеей?"}'),
(50, '{"Answer": 0, "Answers_List": ["99 праведниках, не имеющих нужды в покаянии", "двух грешниках кающихся", "Иисусе Христе", "том когда он перестанет каяться"], "Question": "\\"На небе больше радости об одном грешнике кающемся, чем о .......\\""}'),
(51, '{"Answer": 2, "Answers_List": ["Иуда", "Фарисеи", "Пётр", "Ирод"], "Question": "Кто предал Иисуса продав его за 30 серебренников?"}'),
(52, '{"Answer": 1, "Answers_List": ["40", "70", "20", "3"], "Question": "Сколько лет царствовал Иоас в Иерусалиме?"}'),
(53, '{"Answer": 2, "Answers_List": ["Спаситель", "Бомж", "Пастор", "Тигр"], "Question": "Кто такой Иисус? "}'),
(54, '{"Answer": 2, "Answers_List": ["10", "11", "1", "12"], "Question": "Сколько братьеф Иосифа пришли в Египет за хлебом?"}'),
(55, '{"Answer": 2, "Answers_List": ["Любовь", "Ремня", "Справку", "Денег"], "Question": "Что дал нам Отец Небесный \\"чтобы нам называться и быть детьми Божьими\\"?"}'),
(56, '{"Answer": 0, "Answers_List": ["Моления", "Взятку", "Кузнечика", "Голову Иуды"], "Question": "Что Христос с сильным воплем и со слезами принёс \\"могущему спасти Его отсмерти\\"?"}'),
(57, '{"Answer": 3, "Answers_List": ["дух", "чудо-юдо", "кощей-бессмертный", "дьявол"], "Question": "\\"Рождённое от плоти есть плоть, а рождённое от Духа есть .......\\""}'),
(58, '{"Answer": 1, "Answers_List": ["30", "100", "20", "10"], "Question": "На ....... сребренников кровьМессии люди оценили,А Он с небес им нёc любовь,Хотел, чтоб мирно, дружно жили..."}'),
(59, '{"Answer": 2, "Answers_List": ["На кресте", "В колодце", "В тюрьме", "В речке"], "Question": "Где умер Иисус?"}'),
(60, '{"Answer": 2, "Answers_List": ["Низкоурожайный сорт пшеницы", "Молитва с ударами лбом об пол", "Удар ложкой по лбу человека, который без молитвы начал есть", "Пол чаши вина"], "Question": "Что такое \\"полба\\"?"}'),
(61, '{"Answer": 1, "Answers_List": ["Плащаницей", "Верёвкой", "Полотенцем", "Плащём"], "Question": "Чем Иосиф обвил тело Иисуса?"}'),
(62, '{"Answer": 2, "Answers_List": ["Руфь", "Сарра", "Есфирь", "Мария"], "Question": "Как звали женщину, которая помогала Ноемини?"}'),
(63, '{"Answer": 3, "Answers_List": ["Чехов", "Княжнин ", "Карамзин ", "Ломоносов"], "Question": "Кто автор фразы: \\"Даже болеть приятно, когда знаешь, что есть люди, которыеждут твоего выздоровления, как праздника\\"?"}'),
(64, '{"Answer": 1, "Answers_List": ["восьмой", "десятой", "девятой", "первой"], "Question": "\\"Называя уже теперь вещь своею, мы присваиваем не принадлежащее на, грешим,следовательно, против ....... заповеди...\\" Н.Ф.Фёдоров (1828-1903)"}'),
(65, '{"Answer": 3, "Answers_List": ["Благовестники", "Пастухи", "Торговцы", "Воины"], "Question": "Кто мог пользоваться следующими предметами: посох, обувь, свиток, Библия?"}'),
(66, '{"Answer": 0, "Answers_List": ["3000", "1000", "100", "10"], "Question": "Сколько людей покаялось в день Пятидесятницы?"}'),
(67, '{"Answer": 1, "Answers_List": ["В Афинах", "В Иерусалиме", "В Египте", "В Вифлееме"], "Question": "Где находился жертвенник \\"неведомому богу\\"?"}'),
(68, '{"Answer": 0, "Answers_List": ["Пурим", "Кущи", "Пасха", "Рурим"], "Question": "Как называется праздник, который был установлен в дни царствования Есфири? "}'),
(69, '{"Answer": 0, "Answers_List": ["\\"Дом Мой домом молитвы наречётся\\"", "\\"Я сейчас покажу вам кузькину мать\\"", "\\"Я сейчас покажу вам где раки зимуют\\"", "\\"Бей фарисеев, книжников бей - за это спасибо вам скажет еврей\\""], "Question": "Какие слова произнёс Иисус увидев, что в храме торговали и шумели?"}'),
(70, '{"Answer": 3, "Answers_List": ["113", "1", "75", "150"], "Question": "Какой псалом длиннее?"}'),
(71, '{"Answer": 2, "Answers_List": ["Пресвитер", "Дворник", "Техничка", "Посудомойка"], "Question": "Служитель Божий, в обязанности которого входит печься о духовном благе членовцеркви"}'),
(72, '{"Answer": 2, "Answers_List": ["Сын Единородный", "контролёр народный", "проездной на небо", "чёртик зелёный"], "Question": "В мир послан .......И всякий, веруя в Него,Имеет в небо вход свободныйИ не осудит Бог его."}'),
(73, '{"Answer": 3, "Answers_List": ["Кирилл и Мефодий", "Павел 1", "Павел 2", "Иоанн 3"], "Question": "Кто основал Чехословацкую православную церковь?"}'),
(74, '{"Answer": 0, "Answers_List": ["Саул", "Соломон", "Давид", "Ровоам"], "Question": "О ком этот стих   Поначалу был он скромным,А потом же, став царём,Свой успех признал огромным, -Гордость поселилась в нём."}'),
(75, '{"Answer": 0, "Answers_List": ["Любить", "Убивать", "Материться", "Прыгать с небоскрёба без парашута"], "Question": "\\"....... - значит делать доброе.\\" Л.Н.Толстой (1828-1910)"}'),
(76, '{"Answer": 1, "Answers_List": ["Иисусу", "Ливесею", "Симону", "Варфоломею"], "Question": "Кому Мария выражала свою любовь? "}'),
(77, '{"Answer": 3, "Answers_List": ["От Фомы", "От Луки", "От Марка", "От Иоанна"], "Question": "Какое из названных Евангелий является апокрифическим, не включённым вбиблейский канон?"}'),
(78, '{"Answer": 0, "Answers_List": ["Рыбу", "Арбузы", "Деньги", "Шашлык из котов"], "Question": "Что чаще ели израилетяне? "}'),
(79, '{"Answer": 0, "Answers_List": ["Моисей", "Манассия", "Иофам", "Самуил"], "Question": "Как звали сына Амрама и Иохаведы?"}'),
(80, '{"Answer": 0, "Answers_List": ["Павел и Сила", "Иоанн Креститель", "Апостол Иаков", "Иисус Христос"], "Question": "Кто автор слов: \\"Веруй в Господа Иисуса Христа, и спасёшся ты и весь дом твой\\"?"}'),
(81, '{"Answer": 3, "Answers_List": ["Царь", "Пророк", "Судья", "Тысяченачальник"], "Question": "Кто был Соломон?"}'),
(82, '{"Answer": 0, "Answers_List": ["Филиппы", "Назарет", "Вифлеем", "Иерусалим"], "Question": "В каком городе благовествовали Павел, Лука, Сила, Тимофей?"}'),
(83, '{"Answer": 3, "Answers_List": ["Иисус", "Сатана", "Таракан", "Блоха"], "Question": "Кто помогал Иосифу?(отцу Иисуса) "}'),
(84, '{"Answer": 2, "Answers_List": ["3 месяца", "6 месяцев", "3 дня", "3 года"], "Question": "Иехония царствовал в Иерусалиме ..."}'),
(85, '{"Answer": 2, "Answers_List": ["Тейлор", "Гудвин", "Вуд", "Добсон"], "Question": "Как звать англичанина, основателя миссии в Китае?"}'),
(86, '{"Answer": 2, "Answers_List": ["Иосиф", "Иисус", "Иаков", "Моисей"], "Question": "Как звали юношу, которого братья продали из зависти?"}'),
(87, '{"Answer": 3, "Answers_List": ["Закхей", "Его не звали он сам приходил", "Симон", "Фома"], "Question": "Как звали мытаря сборщика налогов?"}'),
(88, '{"Answer": 0, "Answers_List": ["Линия по производству лейкопластыря", "Руки вверх", "Балаган", "Любэ"], "Question": "Кто поёт такие песни: \\"как Он\\", \\"батарея\\", \\"птица\\"? "}'),
(89, '{"Answer": 3, "Answers_List": ["человека", "животных", "насекомых", "рыб"], "Question": "\\"Воспитание - великое дело: им решается участь .......\\"В.Г.Белинский (1811-1848)"}'),
(90, '{"Answer": 0, "Answers_List": ["Строили стены", "Ломали деревья", "Убивали людей", "Убегали от немцев"], "Question": "Что делал Неемия и его друзья? "}'),
(91, '{"Answer": 0, "Answers_List": ["Апполония", "Фиатира", "Неаполь", "Троада"], "Question": "Как называется город в Македонии, лежащий между Амфиполем и Фессалоникой,который проходил Апостол Павел во время второго пришествия?"}'),
(92, '{"Answer": 2, "Answers_List": ["Иаков и Исав", "Иисус и сатана", "Давид и Саул", "Соломон и Ровоам"], "Question": "О ком этот стих:   Родилися у РевеккиБлизнецы - богатыри, -Разные то человекиИ различных царств цари."}'),
(93, '{"Answer": 3, "Answers_List": ["С вином", "С ружьём", "С киндер-сюрпризом", "С толпой братков"], "Question": "С чем Мелхиседек встречал Авраама, возвращавшегося домой после поражения имКедорлаомера?"}'),
(94, '{"Answer": 3, "Answers_List": ["Вавилон", "Иерусалим", "Рим", "Ефес"], "Question": "Как называется один из древнейших и богатейших городов мира, ставшийвпоследствии \\"ужасом между народами\\"?"}'),
(95, '{"Answer": 3, "Answers_List": ["Критяне", "Сицилийцы", "Кипряне", "Троадовцы"], "Question": "Жители одного из городов, которым его уроженец посвятил одно из своихстихотворений упомянутое в Библии?"}'),
(96, '{"Answer": 2, "Answers_List": ["Иосифа", "Иисуса", "Фому", "Моисея"], "Question": "Кого больше всех любил Иаков из своих 12-ти сыновей? "}'),
(97, '{"Answer": 2, "Answers_List": ["Колода", "Горячим утюгом по животу водили", "Под ногти иголки засовывали", "Над быстрорастущим бамбуком привязывали"], "Question": "Одно из наказаний, которое понёс пророк Иеремия за произнесённое пророчество"}'),
(98, '{"Answer": 0, "Answers_List": ["Девора", "Есфирь", "Руфь", "Мария"], "Question": "Как звали женщину, которая предсказала победу Израильтянам?"}'),
(99, '{"Answer": 1, "Answers_List": ["Овцу", "Ангела", "Летающую корову", "Друг друга"], "Question": "Кого приносили люди в жертву? "}'),
(100, '{"Answer": 12241412412, "Answers_List": [], "Question": "Your flag is QCTF_ea6d2f07efdbef86fba236b7fd91018b"}'),
(101, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
