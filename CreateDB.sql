DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Features;
DROP TABLE IF EXISTS MixtapeEPs;
DROP TABLE IF EXISTS Albums;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS SocialMedia;
DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Labels;

CREATE TABLE Labels (
    name VARCHAR(128) PRIMARY KEY
);

CREATE TABLE Genre (
    typeOf VARCHAR(128) PRIMARY KEY
);

CREATE TABLE Artists (
    stageName VARCHAR(128) PRIMARY KEY,
    realName VARCHAR(128) NOT NULL,
    gender CHAR,
    age INTEGER NOT NULL,
    label VARCHAR(128) NOT NULL, /*Total Participation constraint on Label*/
    FOREIGN KEY (label) REFERENCES Labels(name) /*Artist N SIGNED TO N Label*/
);

CREATE TABLE SocialMedia (
    facebook VARCHAR(128),
    instagram VARCHAR(128),
    twitter VARCHAR(128),
    tiktok VARCHAR(128),
    artist VARCHAR(128),
    PRIMARY KEY (facebook, twitter),
    FOREIGN KEY (artist) REFERENCES Artists(stageName) /*Artist 1 HAVE N SocialMedia*/
);

CREATE TABLE Schedule (
    timeOf TIMESTAMP,
    locationOf VARCHAR(128),
    artist VARCHAR(128),
    PRIMARY KEY (timeOf, locationOf),
    FOREIGN KEY (artist) REFERENCES Artists(stageName) /*Artist N PART_OF 1 Schedule*/
);

CREATE TABLE Albums (
    title VARCHAR(128) PRIMARY KEY,
    artist VARCHAR(128),
    genre VARCHAR(128),
    FOREIGN KEY (artist) REFERENCES Artists(stageName), /*Artist 1 CREATE N Album*/
    FOREIGN KEY (genre) REFERENCES Genre(typeOf) /*Albums N HAVE_A 1 Genre*/
);

CREATE TABLE MixtapeEPs(
    title VARCHAR(128) PRIMARY KEY,
    artist VARCHAR(128),
    genre VARCHAR(128),
    FOREIGN KEY (artist) REFERENCES Artists(stageName), /*Artists 1 CREATE N MixtapeEPs*/
    FOREIGN KEY (genre) REFERENCES Genre(typeOf) /*MixtapeEPs N HAVE_A 1 Genre*/
);

CREATE TABLE Features(
    song_title VARCHAR(128),
    original_artist VARCHAR(128),
    featured_artist VARCHAR(128),
    genre VARCHAR(128),
    PRIMARY KEY (song_title, original_artist),
    FOREIGN KEY (featured_artist) REFERENCES Artists(stageName), /*Artists 1 Part_Of N Features*/
    FOREIGN KEY (genre) REFERENCES Genre(typeOf) /*Features N HAVE_A 1 Genre*/
);

CREATE TABLE Songs (
    title VARCHAR(128),
    lengthInSec INTEGER,
    album VARCHAR(128),
    PRIMARY KEY (title, lengthInSec),
    FOREIGN KEY (album) REFERENCES Albums(title) /*Albums 1 MADE_UP_OF N Songs*/
        ON DELETE CASCADE /*WEAK ENTITY SET*/
);

----------------------------------------------------
/* POPULATE DATA */

/* DATA FOR LABELS */
INSERT INTO Labels VALUES('Om Records');
INSERT INTO Labels VALUES('Republic Records');
INSERT INTO Labels VALUES('AGE 101 Music');
INSERT INTO Labels VALUES('Herzbult Recordings');
INSERT INTO Labels VALUES('Atlantic Records');
INSERT INTO Labels VALUES('Interscope Records');
INSERT INTO Labels VALUES('Warp Records');
INSERT INTO Labels VALUES('7Wallace Records');
INSERT INTO Labels VALUES('Zero Fatigue Records');
INSERT INTO Labels VALUES('Because Music');
INSERT INTO Labels VALUES('Text Records');
INSERT INTO Labels VALUES('Capitol Records');
INSERT INTO Labels VALUES('Capitol Latin Records');
INSERT INTO Labels VALUES('Universal Music Group');

/* DATA FOR GENRE */
INSERT INTO Genre VALUES('Electronic');
INSERT INTO Genre VALUES('Hip Hop');
INSERT INTO Genre VALUES('Funk or Soul');
INSERT INTO Genre VALUES('Pop');
INSERT INTO Genre VALUES('Folk');
INSERT INTO Genre VALUES('Country');
INSERT INTO Genre VALUES('Rock');
INSERT INTO Genre VALUES('Latin');
INSERT INTO Genre VALUES('International');
INSERT INTO Genre VALUES('RnB');
INSERT INTO Genre VALUES('Hip pop');
INSERT INTO Genre VALUES('Jazz');
INSERT INTO Genre VALUES('Dancehall');
INSERT INTO Genre VALUES('Dance');
INSERT INTO Genre VALUES('Alternative');
INSERT INTO Genre VALUES('Classical');
INSERT INTO Genre VALUES('Reggaeton');

/* DATA FOR ARTISTS */
INSERT INTO Artists VALUES('Bassnectar', 'Lorin Ashton', 'M', 43,'Om Records');
INSERT INTO Artists VALUES('Kid Cudi', 'Scott Mescudi', 'M', 37, 'Republic Records');
INSERT INTO Artists 
VALUES('Little Simz', 'Simbiatu Ajikawo', 'F', 27, 'AGE 101 Music');
INSERT INTO Artists 
VALUES('Stephan Bodzin', 'Stephan Bodzin', 'M', 51, 'Herzbult Recordings');
INSERT INTO Artists 
VALUES('Wiz Khalifa', 'Cameron Thomaz', 'M', 33, 'Atlantic Records');
INSERT INTO Artists 
VALUES('Billie Eilish', 'Billie Eilish Baird', 'F', 19, 'Interscope Records');
INSERT INTO Artists VALUES('Aphex Twin', 'Richart James', 'M', 49, 'Warp Records');
INSERT INTO Artists 
VALUES('Idris Elba', 'Idrissa Akuna Elba', 'M', 48, '7Wallace Records');
INSERT INTO Artists 
VALUES('Juice WRLD', 'Jarad Anthony Higgins', 'M', 21, 'Interscope Records');
INSERT INTO Artists 
VALUES('Smino', 'Christopher Smith Jr', 'M', 29, 'Zero Fatigue Records');
INSERT INTO Artists
 VALUES('Christine and the Queens', 'Heloise Lettissier', 'F', 32, 'Because Music');
INSERT INTO Artists VALUES('Four Tet', 'Kieran Heben', 'M', 43, 'Text Records');
INSERT INTO Artists VALUES('Gryffin', 'Dan Griffith', 'M', 32, 'Interscope Records');
INSERT INTO Artists 
VALUES('Maggie Rogers', 'Margaret Rogers', 'F', 26, 'Capitol Records');
INSERT INTO Artists 
VALUES('J Balvin', 'Jose Alvaro Balvin', 'M', 35, 'Capitol Latin Records');
INSERT INTO Artists VALUES('Bob Moses', 'Robert Moses', 'M', 73, 'Text Records');
INSERT INTO Artists VALUES('Bazzi', 'Andrew Bazzi', 'M', 23, 'Atlantic Records');
INSERT INTO Artists 
VALUES('Sabrina Claudio', 'Sabrina Claudio', 'F', 24, 'Atlantic Records');
INSERT INTO Artists 
VALUES('Sheck Wes', 'Khadimou Fall', 'M', 22, 'Interscope Records');
INSERT INTO Artists 
VALUES('Mr Eazi', 'Oluwatosin Ajibade', 'M', 29, 'Universal Music Group');

/* DATA FOR ALBUMS */
INSERT INTO Albums VALUES('Motions of Mutation','Bassnectar','Electronic');
INSERT INTO Albums VALUES('Dicerse Systems of Throb','Bassnectar','Electronic');
INSERT INTO Albums VALUES('A Kid named Cudi','Kid Cudi','Hip Hop');
INSERT INTO Albums VALUES('Rap Hard (The Demo Years)','Kid Cudi','Hip Hop');
INSERT INTO Albums VALUES('E.D.G.E','Little Simz','Hip Hop');
INSERT INTO Albums VALUES('Stillness In Wonderland','Little Simz','Hip Hop');
INSERT INTO Albums VALUES('Liebe lst','Stephan Bodzin','Electronic');
INSERT INTO Albums VALUES('Power Of Ten Remixes','Stephan Bodzin','Electronic');
INSERT INTO Albums VALUES('Prince Of The City: Welcome To Pistolvania','Wiz Khalifa','Hip Hop');
INSERT INTO Albums VALUES('Flight School','Wiz Khalifa','Hip Hop');
INSERT INTO Albums VALUES('Live At Third Man Records','Billie Eilish','Pop');
INSERT INTO Albums VALUES('When We All Fall Asleep, Where Do We Go?','Billie Eilish','Electronic');
INSERT INTO Albums VALUES('Selected Ambient Works 85-92','Aphex Twin','Electronic');
INSERT INTO Albums VALUES('Melodies From Mars','Aphex Twin','Electronic');
INSERT INTO Albums VALUES('Mi Mandela','Idris Elba','Electronic'); 
INSERT INTO Albums VALUES('Murdah Loves, John','Idris Elba','Electronic');
INSERT INTO Albums VALUES('blkswn','Smino','Hip Hop');
INSERT INTO Albums VALUES('NOIR','Smino','Hip Hop');
INSERT INTO Albums VALUES('Nuit 17 A 52','Christine and the Queens','Pop');
INSERT INTO Albums VALUES('Chris','Christine and the Queens','Pop');
INSERT INTO Albums VALUES('Dialogue','Four Tet','Electronic');
INSERT INTO Albums VALUES('Rounds','Four Tet','Electronic');
INSERT INTO Albums VALUES('Gravity','Gryffin','Electronic');
INSERT INTO Albums VALUES('The Echo','Maggie Rogers','Pop');
INSERT INTO Albums VALUES('Blood Ballet','Maggie Rogers','Pop');
INSERT INTO Albums VALUES('Real','J Balvin','Hip Hop'); 
INSERT INTO Albums VALUES('La Familia','J Balvin','Electronic');
INSERT INTO Albums VALUES('Bittersuite In The Ozone','Bob Moses','Jazz');
INSERT INTO Albums VALUES('When Elephants Dream Of Music','Bob Moses','Jazz');
INSERT INTO Albums VALUES('Cosmic','Bazzi','Pop'); 
INSERT INTO Albums VALUES('B2*','Bazzi','Pop'); 
INSERT INTO Albums VALUES('About Time','Sabrina Claudio','Funk or Soul');
INSERT INTO Albums VALUES('Christmas Blues','Sabrina Claudio','Pop');
INSERT INTO Albums VALUES('Mudboy','Sheck Wes','Hip Hop');
INSERT INTO Albums VALUES('Life is Eazi, Vol 1 - Accra To Lagos','Mr Eazi','International'); 
INSERT INTO Albums VALUES('Life is Eazi, Vol 2 - Logos To London','Mr Eazi','International');

/* Data for MixtapeEPs */
INSERT INTO MixtapeEPs VALUES('Reflective (Part 4)', 'Bassnectar', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Reflective (Part 3)', 'Bassnectar', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Reflective (Part 2)', 'Bassnectar', 'Electronic');
INSERT INTO MixtapeEPs VALUES('THE SCOTTS', 'Kid Cudi', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('No One Believes Me', 'Kid Cudi', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Make Her Say', 'Kid Cudi', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Drop 6', 'Little Simz', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Venom', 'Little Simz', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Pink Youth', 'Little Simz', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Strand', 'Stephan Bodzin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Singularity', 'Stephan Bodzin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Sungam', 'Stephan Bodzin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('4 THE LOW', 'Wiz Khalifa', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('The Thrill', 'Wiz Khalifa', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('So High', 'Wiz Khalifa', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Therefore I am', 'Billie Eilish', 'Pop');
INSERT INTO MixtapeEPs VALUES('my future', 'Billie Eilish', 'Pop');
INSERT INTO MixtapeEPs VALUES('No Time To Die', 'Billie Eilish', 'Pop');
INSERT INTO MixtapeEPs VALUES('Peel Session 2', 'Aphex Twin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Collapse EP', 'Aphex Twin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('T69 collapse', 'Aphex Twin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Know Yourself', 'Idris Elba', 'Electronic');
INSERT INTO MixtapeEPs VALUES('On Life (Remixes)', 'Idris Elba', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Part and Bullshit', 'Idris Elba', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Reminds Me Of You', 'Juice WRLD', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('No Me Ame', 'Juice WRLD', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Bandit(with Youngbul Never Broke Again)', 'Juice WRLD', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Plead The .45', 'Smino', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('MLK Dr', 'Smino', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Tempo', 'Smino', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('3SEX', 'Christine and the Queens', 'Pop');
INSERT INTO MixtapeEPs VALUES('La vita nuova', 'Christine and the Queens', 'Pop');
INSERT INTO MixtapeEPs VALUES('Eyes of a child', 'Christine and the Queens', 'Pop');
INSERT INTO MixtapeEPs VALUES('4T Recordings', 'Four Tet', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Baby', 'Four Tet', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Anna Painting', 'Four Tet', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Cry (with John Martin)', 'Gryffin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Gravity Pt. 1', 'Gryffin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Feel Good', 'Gryffin', 'Electronic');
INSERT INTO MixtapeEPs VALUES('Split Stones', 'Maggie Rogers', 'Pop');
INSERT INTO MixtapeEPs VALUES('Alaska(Acoustic)', 'Maggie Rogers', 'Pop');
INSERT INTO MixtapeEPs VALUES('Light On', 'Maggie Rogers', 'Pop');
INSERT INTO MixtapeEPs VALUES('MaG', 'J Balvin', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('LOCATION', 'J Balvin', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Lento', 'J Balvin', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('The Blame (Lastlings Remix)', 'Bob Moses', 'Jazz');
INSERT INTO MixtapeEPs VALUES('The Blame (Dj Seinfield Remix)', 'Bob Moses', 'Jazz');
INSERT INTO MixtapeEPs VALUES('The Blame (Helsloot Remix)', 'Bob Moses', 'Jazz');
INSERT INTO MixtapeEPs VALUES('Crazy', 'Bazzi', 'Pop');
INSERT INTO MixtapeEPs VALUES('I Dont Think Im Okay', 'Bazzi', 'Pop');
INSERT INTO MixtapeEPs VALUES('I Got You', 'Bazzi', 'Pop');
INSERT INTO MixtapeEPs VALUES('Warm December', 'Sabrina Claudio', 'Pop');
INSERT INTO MixtapeEPs VALUES('Come Away', 'Sabrina Claudio', 'Pop');
INSERT INTO MixtapeEPs VALUES('SBCNCSLY', 'Sabrina Claudio', 'Pop');
INSERT INTO MixtapeEPs VALUES('#BEEBALLIN', 'Sheck Wes', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Pick One Day', 'Sheck Wes', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('YKTS', 'Sheck Wes', 'Hip Hop');
INSERT INTO MixtapeEPs VALUES('Something Else', 'Mr Eazi', 'International');
INSERT INTO MixtapeEPs VALUES('The Don', 'Mr Eazi', 'International');

/* DATA FOR FEATURES */
INSERT INTO Features VALUES('Speakerbox - F8 Remix','Lafa Taylor', 'Bassnectar', 'Electronic');
INSERT INTO Features VALUES('Lights - Bassnectar Remix - Bonus Track','Ellie Goulding', 'Bassnectar', 'Pop');
INSERT INTO Features VALUES('M3tamorphosis','Playboi', 'Kid Cudi', 'Hip Hop');
INSERT INTO Features VALUES('Gorgeous','Kanye West', 'Kid Cudi', 'Hip Hop'); 
INSERT INTO Features VALUES('Catapult','Lena', 'Little Simz', 'Pop');
INSERT INTO Features VALUES('Pick Youth','Yuna', 'Little Simz', 'Pop'); 
INSERT INTO Features VALUES('Sleepless','Pan-Pot', 'Stephan Bodzin', 'Dance'); 
INSERT INTO Features VALUES('Everything Counts','Depeche Mode', 'Stephan Bodzin', 'Pop');
INSERT INTO Features VALUES('Giddy Up','Internet Money', 'Wiz Khalifa', 'Hip Hop'); 
INSERT INTO Features VALUES('Bomb','Chris Brown', 'Wiz Khalifa', 'Electronic'); 
INSERT INTO Features VALUES('lovely','Khalid', 'Billie Eilish', 'Alternative'); 
INSERT INTO Features VALUES('COPYCAT','Sofi Tukkr', 'Billie Eilish', 'Alternative'); 
INSERT INTO Features VALUES('Richards Hairpiece','Beck', 'Aphex Twin', 'Country'); 
INSERT INTO Features VALUES('Avril 14th','Daniel Hope', 'Aphex Twin', 'Classical'); 
INSERT INTO Features VALUES('Dance Off','Macklemore', 'Idris Elba', 'Hip Hop');
iNSERT INTO Features VALUES('Boasty','Wiley', 'Idris Elba', 'Dancehall'); 
INSERT INTO Features VALUES('GO','The Kid LAROI', 'Juice WRLD', 'Hip Hop'); 
INSERT INTO Features VALUES('Flex','Polo G', 'Juice WRLD', 'Hip Hop'); 
INSERT INTO Features VALUES('Wont Bite','Doja Cat', 'Smino', 'RnB'); 
INSERT INTO Features VALUES('1993','Dreamville', 'Smino', 'Hip Hop'); 
INSERT INTO Features VALUES('Haine coloree','Tayc', 'Christine and the Queens', 'RnB');
INSERT INTO Features VALUES('Chandelier','Sia', 'Four Tet', 'Pop');
INSERT INTO Features VALUES('Opal','Bicep', 'Four Tet', 'Dance'); 
INSERT INTO Features VALUES('Desire', 'Years and Years', 'Gryffin', 'Pop'); 
INSERT INTO Features VALUES('Dont Leave', 'Snakehips', 'Gryffin', 'Dance'); 
INSERT INTO Features VALUES('Grace','Lewis Capadi', 'Maggie Rogers', 'Alternative');
INSERT INTO Features VALUES('She Will Be Loved','Maroon 5', 'Maggie Rogers', 'Pop'); 
INSERT INTO Features VALUES('Una Locura','Ozuna', 'J Balvin', 'Reggaeton'); 
INSERT INTO Features VALUES('Una Dia','Dua Lipa', 'J Balvin', 'Reggaeton');
INSERT INTO Features VALUES('Boat Song Pt','Billy Martin', 'Bob Moses', 'Jazz'); 
INSERT INTO Features VALUES('Sun Up','Greg Burk', 'Bob Moses', 'Jazz'); 
INSERT INTO Features VALUES('I Dont Even Know You Anymore', 'Netsky', 'Bazzi','Pop'); 
INSERT INTO Features VALUES('Fun','Fancy Cars', 'Bazzi', 'Dance');
INSERT INTO Features VALUES('See The Way','The Chainsmokers', 'Sabrina Claudio', 'Dance');
INSERT INTO Features VALUES('Thats Why I Love You','SiR', 'Sabrina Claudio', 'RnB');
INSERT INTO Features VALUES('Spaceship','Don Toliver', 'Sheck Wes', 'Hip Hop');
INSERT INTO Features VALUES('GANG GANG','JACKBOYS', 'Sheck Wes', 'Hip Hop'); 
INSERT INTO Features VALUES('Arcoiris','J Balvin', 'Mr Eazi', 'Pop');
INSERT INTO Features VALUES('COMO UN BEBE','J Balvin', 'Mr Eazi', 'Pop');

/* Data for Schedule */
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 12:05:00', 'Outdoor Theatre', 'Bassnectar');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 11:55:00', 'Sahara', 'Kid Cudi');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 11:00:00', 'Gobi', 'Little Simz');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 11:02:00', 'Yuma', 'Stephan Bodzin');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 10:05:00', 'Sahara', 'Wiz Khalifa');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 09:35:00', 'Outdoor Theatre', 'Billie Eilish');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 09:05:00', 'Mojave', 'Aphex Twin');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 09:00:00', 'Yuma', 'Idris Elba');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 08:45:00', 'Sahara', 'Juice WRLD');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 08:35:00', 'Gobi', 'Smino');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 07:45:00', 'Outdoor Theatre', 'Christine and the Queens');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 07:35:00', 'Mojave', 'Four Tet');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 07:20:00', 'Sahara', 'Gryffin');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 07:20:00', 'Gobi','Maggie Rogers');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 07:15:00', 'Coachella Stage', 'J Balvin');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 06:25:00', 'Outdoor Theatre', 'Bob Moses');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 06:05:00', 'Coachella Stage', 'Bazzi');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 04:55:00', 'Coachella Stage', 'Sabrina Claudio');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 04:45:00', 'Sahara', 'Sheck Wes');
INSERT INTO Schedule VALUES(TIMESTAMP '2019-04-13 03:50:00', 'Coachella Stage', 'Mr Eazi');

/* Data For Social Media */
INSERT INTO SocialMedia VALUES('Bassnectar', '@bassnectar', '@bassnectar', NULL, 'Bassnectar');
INSERT INTO SocialMedia VALUES('Kid C', '@thekidcudi', '@KidCudi', NULL, 'Kid Cudi');
INSERT INTO SocialMedia VALUES('LittleSimz', '@littlesimz', '@LittleSimz', NULL, 'Little Simz');
INSERT INTO SocialMedia VALUES('Stephan Bozin', '@stephanbozin', '@stephanbozin', NULL, 'Stephan Bodzin');
INSERT INTO SocialMedia VALUES('Whiz Khalifa', '@whizkhalifa', '@whizkhalifa', NULL, 'Wiz Khalifa');
INSERT INTO SocialMedia VALUES('Billie Eilish', '@billieeilish', '@billieeilish', NULL, 'Billie Eilish');
INSERT INTO SocialMedia VALUES('Aphex Twin', '@aphextwin', '@aphextwin', NULL, 'Aphex Twin');
INSERT INTO SocialMedia VALUES('Idris Elba', '@idriselba', '@idriselba', NULL, 'Idris Elba');
INSERT INTO SocialMedia VALUES('Juice Wrld', '@juicewrld999', '@JuiceWorlddd', NULL, 'Juice WRLD');
INSERT INTO SocialMedia VALUES('Simno', '@simno', '@simno', NULL, 'Smino');
INSERT INTO SocialMedia VALUES('Christine and the Queens', '@christineandthequeens', '@christineandthequeens', NULL, 'Christine and the Queens');
INSERT INTO SocialMedia VALUES('Four Tet', '@fourtetkieran', '@FourTet', NULL,'Four Tet');
INSERT INTO SocialMedia VALUES('Gryffin', '@gryffinofficial', '@gryffinofficial', NULL,'Gryffin');
INSERT INTO SocialMedia VALUES('Maggie Rogers', '@maggierogers', '@maggierogers', NULL,'Maggie Rogers');
INSERT INTO SocialMedia VALUES('J Balvin', '@jbalvin', '@JBALVIN', NULL,'J Balvin');
INSERT INTO SocialMedia VALUES('Bob Moses','@bobmosesmsuic','@bobmosesmusic', NULL,'Bob Moses');
INSERT INTO SocialMedia VALUES('Bazzi','@bazzi','@bazzi', NULL,'Bazzi');
INSERT INTO SocialMedia VALUES('Sabrina Claudio','@sabrinaclaudio','@sabrinaclaudio', NULL,'Sabrina Claudio');
INSERT INTO SocialMedia VALUES('Sheck Wes','@sheckwes','@sheckwes', NULL,'Sheck Wes');
INSERT INTO SocialMedia VALUES('Mr Eazi','@mreazi','@mreazi', NULL,'Mr Eazi');

/* DATA FOR ALBUM SONGS */
INSERT INTO Songs VALUES('Intro', 53, 'Motions of Mutation');
INSERT INTO Songs VALUES('Release (Bushdoctor remix)', 278, 'Motions of Mutation');
INSERT INTO Songs VALUES('Udu Shuffle', 402, 'Motions of Mutation');
INSERT INTO Songs VALUES('Sisters of 7 (Bassnectar remix', 305, 'Motions of Mutation');
INSERT INTO Songs VALUES('Not in Our Name (Bassnectar mix)', 354, 'Motions of Mutation');
 
INSERT INTO Songs VALUES('Intro', 54, 'Dicerse Systems of Throb');
INSERT INTO Songs VALUES('Replenish', 378, 'Dicerse Systems of Throb');
INSERT INTO Songs VALUES('The Wicked Twitch of the West', 257, 'Dicerse Systems of Throb');
INSERT INTO Songs VALUES('Laughter Crescendo', 314, 'Dicerse Systems of Throb');
 
INSERT INTO Songs VALUES('Intro', 50, 'A Kid named Cudi');
INSERT INTO Songs VALUES('Down Out', 246, 'A Kid named Cudi');
INSERT INTO Songs VALUES('Is There Any Love', 210, 'A Kid named Cudi');
INSERT INTO Songs VALUES('Cudi Get', 140, 'A Kid named Cudi');
INSERT INTO Songs VALUES('Man On The Moon', 207, 'A Kid named Cudi');
 
INSERT INTO Songs VALUES('Skit', 260, 'Rap Hard (The Demo Years)');
INSERT INTO Songs VALUES('Interlude', 280, 'Rap Hard (The Demo Years)');
INSERT INTO Songs VALUES('Rap Hard (Intro)', 200, 'Rap Hard (The Demo Years)');
INSERT INTO Songs VALUES('Spontaneously Combust', 370, 'Rap Hard (The Demo Years)');
INSERT INTO Songs VALUES('Im Not the Average', 228, 'Rap Hard (The Demo Years)');
 
INSERT INTO Songs VALUES('Desire', 200, 'E.D.G.E');
INSERT INTO Songs VALUES('Enter the Void', 230, 'E.D.G.E');
INSERT INTO Songs VALUES('On the Edge', 195, 'E.D.G.E');
INSERT INTO Songs VALUES('Devour', 178, 'E.D.G.E');
INSERT INTO Songs VALUES('E.D.G.E / Age 101', 369, 'E.D.G.E');
 
INSERT INTO Songs VALUES('Cheshires Interlude: Welcome To Wonderland', 62, 'Stillness In Wonderland');
INSERT INTO Songs VALUES('One In Rotation + Wide Awake', 235, 'Stillness In Wonderland');
INSERT INTO Songs VALUES('Zone 3', 221, 'Stillness In Wonderland');
INSERT INTO Songs VALUES('Days Like This - Interlude', 194, 'Stillness In Wonderland');
INSERT INTO Songs VALUES('Morning w Swooping Duck', 203, 'Stillness In Wonderland');
 
INSERT INTO Songs VALUES('Leuchtkraft', 414, 'Liebe lst');
INSERT INTO Songs VALUES('Turbine', 472, 'Liebe lst');
INSERT INTO Songs VALUES('Vendetta', 396, 'Liebe lst');
INSERT INTO Songs VALUES('Luka-Leon', 448, 'Liebe lst');
INSERT INTO Songs VALUES('Sonnenwind',446, 'Liebe lst');
 
INSERT INTO Songs VALUES('Ix [Marc Romboy Lost in Leploops]',390, 'Power Of Ten Remixes');
INSERT INTO Songs VALUES('Zulu Pan-Pot Remix',203, 'Power Of Ten Remixes');
INSERT INTO Songs VALUES('Wir Edu Imbernon And Coyu Remix',203, 'Power Of Ten Remixes');
INSERT INTO Songs VALUES('Lila Nicolas Masseyeff Remix',253, 'Power Of Ten Remixes');
INSERT INTO Songs VALUES('Singularity Fur Coat Remix',253, 'Power Of Ten Remixes');
 
INSERT INTO Songs VALUES('Bars',147,'Prince Of The City: Welcome To Pistolvania');
INSERT INTO Songs VALUES('53rd',291,'Prince Of The City: Welcome To Pistolvania');
INSERT INTO Songs VALUES('Do Sumtin',231,'Prince Of The City: Welcome To Pistolvania');
INSERT INTO Songs VALUES('Get Away',65,'Prince Of The City: Welcome To Pistolvania');
INSERT INTO Songs VALUES('Lay Em Down',220,'Prince Of The City: Welcome To Pistolvania');
 
INSERT INTO Songs VALUES('Boarding Pass',156,'Flight School');
INSERT INTO Songs VALUES('Mr. Rightfernow',171,'Flight School');
INSERT INTO Songs VALUES('Shame',210,'Flight School');
INSERT INTO Songs VALUES('Dreamer',142,'Flight School');
INSERT INTO Songs VALUES('Get Sum',204,'Flight School');
 
INSERT INTO Songs VALUES('bad guy',194,'Live At Third Man Records');
INSERT INTO Songs VALUES('bellyache',179,'Live At Third Man Records');
INSERT INTO Songs VALUES('when the partys over',196,'Live At Third Man Records');
INSERT INTO Songs VALUES('i love you',254,'Live At Third Man Records');
INSERT INTO Songs VALUES('COPYCAT',124,'Live At Third Man Records');
 
INSERT INTO Songs VALUES('wish you were gay',221,'When We All Fall Asleep, Where Do We Go?');
INSERT INTO Songs VALUES('bad guy',196,'When We All Fall Asleep, Where Do We Go?');
INSERT INTO Songs VALUES('bury a friend',199,'When We All Fall Asleep, Where Do We Go?');
INSERT INTO Songs VALUES('you should see me in a crown',180,'When We All Fall Asleep, Where Do We Go?');
INSERT INTO Songs VALUES('xanny',243,'When We All Fall Asleep, Where Do We Go?');
 
INSERT INTO Songs VALUES('Schottkey 7th Path',305,'Selected Ambient Works 85-92');
INSERT INTO Songs VALUES('Heliosphan',358,'Selected Ambient Works 85-92');
INSERT INTO Songs VALUES('Hedphelym',368,'Selected Ambient Works 85-92');
INSERT INTO Songs VALUES('Green Calx',265,'Selected Ambient Works 85-92');
INSERT INTO Songs VALUES('Ageispolis',305,'Selected Ambient Works 85-92');
 
INSERT INTO Songs VALUES('Melody One',198,'Melodies From Mars');
INSERT INTO Songs VALUES('Fingerbib (Demo Version)',246,'Melodies From Mars');
INSERT INTO Songs VALUES('Melody Three',254,'Melodies From Mars');
INSERT INTO Songs VALUES('Melody Four',253,'Melodies From Mars');
INSERT INTO Songs VALUES('Melody Five',250,'Melodies From Mars');
 
INSERT INTO Songs VALUES('Aero Mathata',297,'Mi Mandela');
INSERT INTO Songs VALUES('mi Mandela',246,'Mi Mandela');
INSERT INTO Songs VALUES('Thank You For Freedom',202,'Mi Mandela');
INSERT INTO Songs VALUES('Home',305,'Mi Mandela');
INSERT INTO Songs VALUES('Hold On',266,'Mi Mandela');
 
INSERT INTO Songs VALUES('Sinner Man',235,'Murdah Loves, John');
INSERT INTO Songs VALUES('Bridges',230,'Murdah Loves, John');
INSERT INTO Songs VALUES('Paradise',125,'Murdah Loves, John');
INSERT INTO Songs VALUES('Finish Line',321,'Murdah Loves, John');
INSERT INTO Songs VALUES('Alice Loves',192,'Murdah Loves, John');
 
INSERT INTO Songs VALUES('Long Run',294,'blkswn');
INSERT INTO Songs VALUES('B Role',181,'blkswn');
INSERT INTO Songs VALUES('Glass Flows',188,'blkswn');
INSERT INTO Songs VALUES('Lobby Kall',142,'blkswn');
INSERT INTO Songs VALUES('Anita',192,'blkswn');
 
INSERT INTO Songs VALUES('PIZANO',199,'NOIR');
INSERT INTO Songs VALUES('WE GOT THE BISCUITS',214,'NOIR');
INSERT INTO Songs VALUES('TEQUILA MOCKINGBIRD',180,'NOIR');
INSERT INTO Songs VALUES('KOVERT',274,'NOIR');
INSERT INTO Songs VALUES('L.M.F',479,'NOIR');
 
INSERT INTO Songs VALUES('Photos souvenirs',180,'Nuit 17 A 52');
INSERT INTO Songs VALUES('Starshipper',199,'Nuit 17 A 52');
INSERT INTO Songs VALUES('Wandering Lovers',213,'Nuit 17 A 52');
INSERT INTO Songs VALUES('The Loving Cup',224,'Nuit 17 A 52');
INSERT INTO Songs VALUES('Nuit 17 a 52',124,'Nuit 17 A 52');
 
INSERT INTO Songs VALUES('The Stranger',259,'Chris');
INSERT INTO Songs VALUES('Bruce est dans le brouillard',241,'Chris');
INSERT INTO Songs VALUES('5 dols',124,'Chris');
INSERT INTO Songs VALUES('Damn (What Must a Woman Do)',231,'Chris');
INSERT INTO Songs VALUES('La Marcheuse',289,'Chris');
 
INSERT INTO Songs VALUES('The Space of Two Weeks',241,'Dialogue');
INSERT INTO Songs VALUES('Chiron',335,'Dialogue');
INSERT INTO Songs VALUES('Alambradas',321,'Dialogue');
INSERT INTO Songs VALUES('3.3 Degrees from the Pole',190,'Dialogue');
INSERT INTO Songs VALUES('Misnomer',432,'Dialogue');
 
INSERT INTO Songs VALUES('Hands',401,'Rounds');
INSERT INTO Songs VALUES('She Moves She',213,'Rounds');
INSERT INTO Songs VALUES('First Thing',128,'Rounds');
INSERT INTO Songs VALUES('My Angel Rocks Back And Forth',355,'Rounds');
INSERT INTO Songs VALUES('Spirit Fingers',124,'Rounds');
 
INSERT INTO Songs VALUES('Intro',55,'Gravity');
INSERT INTO Songs VALUES('All You Need To Know',185,'Gravity');
INSERT INTO Songs VALUES('Need Your Love',124,'Gravity');
INSERT INTO Songs VALUES('Tie Me DOwn',315,'Gravity');
INSERT INTO Songs VALUES('Nothing Like You',512,'Gravity');
 
INSERT INTO Songs VALUES('By Morning',421,'The Echo');
INSERT INTO Songs VALUES('Wolves',121,'The Echo');
INSERT INTO Songs VALUES('A Love Letter',189,'The Echo');
INSERT INTO Songs VALUES('Satellite',245,'The Echo');
INSERT INTO Songs VALUES('Embers',288,'The Echo');
 
INSERT INTO Songs VALUES('Symmetry',163,'Blood Ballet');
INSERT INTO Songs VALUES('Drift (Demo)',190,'Blood Ballet');
INSERT INTO Songs VALUES('James',214,'Blood Ballet');
INSERT INTO Songs VALUES('Drift',196,'Blood Ballet');
INSERT INTO Songs VALUES('Blood Ballet',221,'Blood Ballet');
 
INSERT INTO Songs VALUES('No Me Vuelvo a Enamorar',182,'Real');
INSERT INTO Songs VALUES('Sobrenatural',189,'Real');
INSERT INTO Songs VALUES('Inalcanzable',289,'Real');
INSERT INTO Songs VALUES('Fantasia',229,'Real');
INSERT INTO Songs VALUES('Pa La Tumbla',209,'Real');
 
INSERT INTO Songs VALUES('Imaginandote',180,'La Familia');
INSERT INTO Songs VALUES('What a Creation',284,'La Familia');
INSERT INTO Songs VALUES('Mil fantasias',126,'La Familia');
INSERT INTO Songs VALUES('6:00 AM',501,'La Familia');
INSERT INTO Songs VALUES('Bajo la luna',216,'La Familia');
 
INSERT INTO Songs VALUES('Mfwala Myo La La',216,'Bittersuite In The Ozone');
INSERT INTO Songs VALUES('Glitteragbas Solo',541,'Bittersuite In The Ozone');
INSERT INTO Songs VALUES('Bittersuite In The Ozone',517,'Bittersuite In The Ozone');
INSERT INTO Songs VALUES('Stanley Free',124,'Bittersuite In The Ozone');
INSERT INTO Songs VALUES('Message To The Music Bizness',519,'Bittersuite In The Ozone');
 
INSERT INTO Songs VALUES('Trevor',612,'When Elephants Dream Of Music');
INSERT INTO Songs VALUES('Picolo and Lulu',251,'When Elephants Dream Of Music');
INSERT INTO Songs VALUES('Everyone Knows You When Youre',141,'When Elephants Dream Of Music');
INSERT INTO Songs VALUES('Lava Flow',125,'When Elephants Dream Of Music');
INSERT INTO Songs VALUES('Happy to Be Here Today',245,'When Elephants Dream Of Music');
 
INSERT INTO Songs VALUES('Mine',333,'Cosmic');
INSERT INTO Songs VALUES('Beautiful',142,'Cosmic');
INSERT INTO Songs VALUES('Star',197,'Cosmic');
INSERT INTO Songs VALUES('Changed',497,'Cosmic');
INSERT INTO Songs VALUES('Why',407,'Cosmic');
 
INSERT INTO Songs VALUES('Young and Alive',417,'B2*');
INSERT INTO Songs VALUES('Renees Song',117,'B2*');
INSERT INTO Songs VALUES('I Got You',187,'B2*');
INSERT INTO Songs VALUES('Free*',257,'B2*');
 
INSERT INTO Songs VALUES('Wanna Know',257,'About Time');
INSERT INTO Songs VALUES('We Have Time',250,'About Time');
INSERT INTO Songs VALUES('Belong to you',210,'About Time');
INSERT INTO Songs VALUES('Natural',219,'About Time');
INSERT INTO Songs VALUES('About Time (Intro)',52,'About Time');
 
INSERT INTO Songs VALUES('I Just Mellt',152,'Christmas Blues');
INSERT INTO Songs VALUES('The Christmas Song',214,'Christmas Blues');
INSERT INTO Songs VALUES('Christmas Blues',227,'Christmas Blues');
INSERT INTO Songs VALUES('Oh Holy Night',97,'Christmas Blues');
INSERT INTO Songs VALUES('Have Yourself A Merry Little Christmas',427,'Christmas Blues');
 
INSERT INTO Songs VALUES('Mo Bamba',247,'Mudboy');
INSERT INTO Songs VALUES('Gmail',417,'Mudboy');
INSERT INTO Songs VALUES('Jiggy on the Shits',400,'Mudboy');
INSERT INTO Songs VALUES('Kyrie',301,'Mudboy');
INSERT INTO Songs VALUES('WESPN',111,'Mudboy');
 
INSERT INTO Songs VALUES('Leg Over',189,'Life is Eazi, Vol 1 - Accra To Lagos');
INSERT INTO Songs VALUES('Business',180,'Life is Eazi, Vol 1 - Accra To Lagos');
INSERT INTO Songs VALUES('Tillapia',170,'Life is Eazi, Vol 1 - Accra To Lagos');
INSERT INTO Songs VALUES('2 People',220,'Life is Eazi, Vol 1 - Accra To Lagos');
INSERT INTO Songs VALUES('Feelings',214,'Life is Eazi, Vol 1 - Accra To Lagos');
 
INSERT INTO Songs VALUES('Lagos Gyrations (Intro)',221,'Life is Eazi, Vol 2 - Logos To London');
INSERT INTO Songs VALUES('Surrender',189,'Life is Eazi, Vol 2 - Logos To London');
INSERT INTO Songs VALUES('Dabebi',289,'Life is Eazi, Vol 2 - Logos To London');
INSERT INTO Songs VALUES('Suffer Head',209,'Life is Eazi, Vol 2 - Logos To London');
INSERT INTO Songs VALUES('Properties',139,'Life is Eazi, Vol 2 - Logos To London');


/*UPDATE TABLE*/
UPDATE SocialMedia SET FACEBOOK = 'Kid Cudis New Facebook' WHERE TWITTER = '@KidCudi';

/*DROP TUPLE*/
DELETE FROM SocialMedia WHERE TWITTER = '@KidCudi';

/*INSERT THE ORGINAL TUPLE BACK IN*/
INSERT INTO SocialMedia VALUES('Kid C', '@thekidcudi', '@KidCudi', NULL, 'Kid Cudi');

/*Deleting an album to show that cascading works for deletion of his songs as well*/
DELETE FROM Albums WHERE TITLE = 'A Kid named Cudi';
