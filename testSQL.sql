DROP TABLE IF EXISTS SRBooking;
DROP TABLE IF EXISTS SRPackageType;
DROP TABLE IF EXISTS SRSlot;
DROP TABLE IF EXISTS SRUser;
DROP TABLE IF EXISTS PHBooking;
DROP TABLE IF EXISTS PHPetType;
DROP TABLE IF EXISTS PHRole;
DROP TABLE IF EXISTS PHUser;

CREATE TABLE SRUser (
    Id       INT            IDENTITY (1, 1) NOT NULL,
    Email    VARCHAR (20)   NOT NULL,
    Name     VARCHAR (50)   NOT NULL,
    Password VARBINARY (50) NULL,
    Role     VARCHAR (50)   DEFAULT ('user') NULL,
    PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT AK_SRUser_Email UNIQUE NONCLUSTERED (Email ASC)
);

SET IDENTITY_INSERT SRUser ON
INSERT INTO SRUser (Id, Email, Name, Password, Role) VALUES 
(1, 'axel@yahoo.com', 'Axel', HASHBYTES('SHA1', 'password'), 'User'),
(2, 'carl@yahoo.com', 'Carl', HASHBYTES('SHA1', 'password'), 'Admin'),
(3, 'jacob@yahoo.com', 'Jacob', HASHBYTES('SHA1', 'password'), 'User'),
(5, 'earl@yahoo.com', 'Earl', HASHBYTES('SHA1', 'password'), 'User'),
(6, 'chris@yahoo.com', 'Chris', HASHBYTES('SHA1', 'password'), 'User'),
(7, 'rudolph@yahoo.com', 'Rudolph', HASHBYTES('SHA1', 'password'), 'User'),
(8, 'tasha@yahoo.com', 'Tasha', HASHBYTES('SHA1', 'password'), 'User'),
(9, 'miriam@yahoo.com', 'Miriam', HASHBYTES('SHA1', 'password'), 'User'),
(10, 'lula@yahoo.com', 'Lula', HASHBYTES('SHA1', 'password'), 'User')
SET IDENTITY_INSERT SRUser OFF

CREATE TABLE SRPackageType (
    Id          INT          IDENTITY (1, 1) NOT NULL,
    Description VARCHAR (45) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);

SET IDENTITY_INSERT SRPackageType ON
INSERT INTO SRPackageType (Id, Description) VALUES 
(1, 'Party Karaoke'),
(2, 'Practice Studio'),
(3, 'Practice Studio with Vocal Coach');
SET IDENTITY_INSERT SRPackageType OFF

CREATE TABLE SRSlot (
    Id          INT          NOT NULL,
    Description VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);

INSERT INTO SRSlot (Id, Description) VALUES 
(11, '11:00 AM'),
(12, '12:00 PM'),
(13, '01:00 PM'),
(14, '02:00 PM'),
(15, '03:00 PM'),
(16, '04:00 PM'),
(17, '05:00 PM'),
(18, '06:00 PM'),
(19, '07:00 PM'),
(20, '08:00 PM'),
(21, '09:00 PM');

CREATE TABLE SRBooking (
    Id            INT          IDENTITY (1, 1) NOT NULL,
    BookingDate   DATE         NOT NULL,
    SlotId        INT          NOT NULL,
    Name          VARCHAR (50) NOT NULL,
    PackageTypeId INT          NOT NULL,
    Hours         INT          NOT NULL,
    AOSnack       BIT          NOT NULL,
    AODrink       BIT          NOT NULL,
    BookedBy      INT          NULL,
    Cost        FLOAT (53)   DEFAULT ((0)) NOT NULL,
    CONSTRAINT PK_SRBooking PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_SRBooking_ToSRPackageType FOREIGN KEY (PackageTypeId) REFERENCES SRPackageType (Id),
    CONSTRAINT FK_SRBooking_ToSRSlot FOREIGN KEY (SlotId) REFERENCES SRSlot (Id)
);

SET IDENTITY_INSERT SRBooking ON
INSERT INTO SRBooking (Id, BookingDate, SlotId, Name, PackageTypeId, Hours, AOSnack, AODrink, BookedBy, Cost) VALUES 
(1, '2016-01-03', 17, 'Jennifer Adams', 1, 2, 1, 0, 1, 30),
(2, '2016-01-04', 18, 'Ralph Parker', 3, 2, 1, 1, 8, 80),
(3, '2016-01-09', 16, 'Patricia Walker', 2, 1, 0, 1, 8, 30),
(4, '2016-01-26', 21, 'Elizabeth Lewis', 2, 1, 0, 0, 3, 20),
(5, '2016-01-31', 15, 'Sandra Rodriguez', 3, 3, 0, 1, 10, 100),
(6, '2016-02-02', 18, 'Evelyn Allen', 1, 3, 0, 0, 8, 30),
(7, '2016-02-08', 21, 'Amanda Long', 3, 1, 0, 1, 6, 40),
(8, '2016-02-08', 11, 'Gerald Coleman', 1, 2, 0, 0, 3, 20),
(9, '2016-02-21', 11, 'John Lam', 3, 1, 0, 1, 4, 40),
(10, '2016-02-22', 18, 'Andrea Hall', 1, 1, 1, 1, 8, 30),
(11, '2016-03-08', 21, 'Christine Washington', 2, 2, 0, 1, 9, 50),
(12, '2016-03-15', 21, 'Katherine Cooper', 2, 3, 0, 0, 2, 60),
(13, '2016-03-16', 17, 'Anthony Ward', 3, 2, 1, 0, 5, 70),
(14, '2016-03-21', 17, 'Martha Bennett', 3, 2, 1, 1, 5, 80),
(15, '2016-03-24', 17, 'Kathleen Patterson', 3, 3, 0, 1, 8, 100),
(16, '2016-03-29', 20, 'Eugene Roberts', 1, 2, 0, 0, 10, 20),
(17, '2016-04-27', 18, 'Alice Johnson', 2, 1, 1, 1, 9, 40),
(18, '2016-05-01', 14, 'Heather Barnes', 1, 1, 1, 1, 9, 30),
(19, '2016-05-02', 11, 'Tammy Perry', 3, 2, 0, 0, 10, 60),
(20, '2016-05-07', 15, 'Lisa Murphy', 1, 1, 1, 0, 2, 20),
(21, '2016-05-12', 17, 'Ronald Garcia', 2, 3, 0, 1, 8, 70),
(22, '2016-05-13', 17, 'Robert Griffin', 2, 3, 1, 0, 4, 70),
(23, '2016-05-19', 13, 'Frank Taylor', 3, 1, 0, 1, 7, 40),
(24, '2016-05-27', 17, 'Kathy Reed', 3, 1, 1, 0, 7, 40),
(25, '2016-06-01', 19, 'Rebecca Hernandez', 1, 3, 1, 0, 8, 40),
(26, '2016-06-06', 15, 'Shirley Nelson', 2, 2, 1, 0, 8, 50),
(27, '2016-06-10', 16, 'Keith Sanchez', 1, 2, 1, 0, 5, 30),
(28, '2016-06-27', 12, 'Kevin Russell', 3, 1, 0, 0, 3, 30),
(29, '2016-08-04', 16, 'Bruce Collins', 1, 3, 0, 0, 6, 30),
(30, '2016-08-12', 11, 'Shawn Rivera', 1, 1, 1, 1, 2, 30),
(31, '2016-08-26', 19, 'George Bell', 1, 1, 0, 0, 8, 10),
(32, '2016-08-31', 14, 'Lori Lee', 3, 2, 1, 0, 9, 70),
(33, '2016-09-09', 21, 'Roy Gonzalez', 1, 3, 1, 1, 1, 50),
(34, '2016-09-22', 12, 'Jane Thomas', 3, 1, 1, 0, 4, 40),
(35, '2016-09-25', 13, 'Jimmy Peterson', 2, 2, 1, 1, 2, 60),
(36, '2016-09-29', 19, 'Johnny Ramirez', 2, 3, 1, 1, 10, 80),
(37, '2016-10-27', 17, 'Louis Wilson', 2, 1, 1, 1, 7, 40),
(38, '2016-11-05', 18, 'Judith Butler', 1, 1, 0, 0, 6, 10),
(39, '2016-11-08', 20, 'Angela Gonzales', 2, 3, 0, 1, 4, 70),
(40, '2016-11-20', 12, 'Brenda Edwards', 3, 3, 0, 0, 4, 90),
(41, '2016-11-27', 16, 'Carlos Hill', 2, 3, 1, 0, 5, 70),
(42, '2016-11-29', 14, 'Barbara Brown', 1, 3, 0, 1, 2, 40),
(43, '2016-12-08', 11, 'Sara Moore', 2, 2, 1, 0, 8, 50),
(44, '2016-12-12', 16, 'Emily Young', 2, 1, 0, 0, 9, 20),
(45, '2016-12-13', 16, 'Dang Lang', 3, 1, 0, 1, 4, 40),
(46, '2016-12-25', 12, 'Nicol Ta', 3, 1, 1, 1, 4, 50),
(47, '2016-12-27', 14, 'Louise Jenkins', 1, 1, 1, 1, 8, 30)
SET IDENTITY_INSERT SRBooking OFF

CREATE TABLE PHRole (
    RoleName VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED (RoleName ASC)
);

INSERT INTO PHRole (RoleName) VALUES ('Admin')
INSERT INTO PHRole (RoleName) VALUES ('User')

CREATE TABLE PHUser (
    Id       INT            IDENTITY (1, 1) NOT NULL,
    Email    VARCHAR (20)   NOT NULL,
    Name     VARCHAR (50)   NOT NULL,
    Password VARBINARY (50) NOT NULL,
    Role     VARCHAR (50)   DEFAULT ('User') NOT NULL,
    CONSTRAINT PK_User PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT AK_User_Email UNIQUE NONCLUSTERED (Email ASC)
);

GO

SET IDENTITY_INSERT PHUser ON
INSERT INTO PHUser (Id, Email, Name, Password, Role) VALUES 
(1, 'clark@yahoo.com', 'Clark', HASHBYTES('SHA1', 'password'), 'User'),
(2, 'bernard@yahoo.com', 'Bernard', HASHBYTES('SHA1', 'password'), 'Admin'),
(3, 'ina@yahoo.com', 'Ina', HASHBYTES('SHA1', 'password'), 'User'),
(5, 'justin@yahoo.com', 'Justin', HASHBYTES('SHA1', 'password'), 'User'),
(6, 'jaime@yahoo.com', 'Jaime', HASHBYTES('SHA1', 'password'), 'User'),
(8, 'francis@yahoo.com', 'Francis', HASHBYTES('SHA1', 'password'), 'User'),
(9, 'daryl@yahoo.com', 'Daryl', HASHBYTES('SHA1', 'password'), 'User'),
(10, 'willis@yahoo.com', 'Willis', HASHBYTES('SHA1', 'password'), 'User')
SET IDENTITY_INSERT PHUser OFF

GO

CREATE TABLE PHPetType (
    Id          INT          IDENTITY (1, 1) NOT NULL,
    Description VARCHAR (45) NOT NULL,
    PRIMARY KEY CLUSTERED (Id ASC)
);

SET IDENTITY_INSERT PHPetType ON
INSERT INTO PHPetType (Id, Description) VALUES 
(1, 'hamster'),
(2, 'cat'),
(3, 'dog'),
(4, 'rabbit'),
(5, 'fish'),
(6, 'birds'),
(7, 'others');
SET IDENTITY_INSERT PHPetType OFF

CREATE TABLE PHBooking (
    Id          INT          IDENTITY (1, 1) NOT NULL,
    NRIC        VARCHAR (20) NOT NULL,
    OwnerName   VARCHAR (50) NOT NULL,
    PetName     VARCHAR (50) NOT NULL,
    Days        INT          NOT NULL,
    PetTypeId   INT          NOT NULL,
    FeedFreq    INT          NOT NULL,
    FTCanned    BIT          NOT NULL,
    FTDry       BIT          NOT NULL,
    FTSoft      BIT          NOT NULL,
    CheckInDate DATE         NOT NULL,
	BookedBy	INT			 NULL,
    Cost        FLOAT (53)   DEFAULT ((0)) NOT NULL,
    CONSTRAINT PK_Table PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_Booking_ToPHPetType FOREIGN KEY (PetTypeId) REFERENCES PHPetType (Id)
);


SET IDENTITY_INSERT PHBooking ON
INSERT INTO PHBooking (Id, NRIC, OwnerName, PetName, Days, PetTypeId, FeedFreq, FTCanned, FTDry, FTSoft, CheckInDate, BookedBy, Cost) VALUES 
(1, 'S5533445H', 'Kimberly Lim', 'Bite', 2, 3, 2, 1, 0, 1, '2016-01-03', 1, 60),
(2, 'S7567499E', 'Donald Lee', 'Bobo', 3, 3, 2, 1, 1, 0, '2016-01-04', 1, 85),
(3, 'S6899123G', 'Jim Kim', 'Cutie', 5, 5, 1, 0, 0, 1, '2016-01-09', 2, 130),
(4, 'S8675333F', 'Jarvel Mun', 'munny', 3, 1, 2, 0, 1, 0, '2016-01-26', 2, 80),
(5, 'S8136278H', 'Jennifer Adams', 'Wowo', 4, 5, 0, 1, 1, 1, '2016-01-31', 3, 115),
(6, 'S7503656I', 'Ralph Parker', 'Zeze', 5, 3, 0, 0, 1, 1, '2016-02-02', 5, 135),
(7, 'S1183710H', 'Patricia Walker', 'Fafa', 3, 5, 0, 0, 0, 0, '2016-02-08', 6, 75),
(8, 'S1898695E', 'Elizabeth Lewis', 'Caca', 1, 3, 2, 1, 1, 0, '2016-02-08', 9, 35),
(9, 'S7238477I', 'Sandra Rodriguez', 'Lili', 2, 3, 0, 0, 1, 1, '2016-02-21', 6, 60),
(10, 'S4510026H', 'Evelyn Allen', 'Fefe', 4, 7, 2, 0, 0, 1, '2016-02-22', 5, 105),
(11, 'S7884339H', 'Amanda Long', 'Tutu', 2, 1, 1, 0, 1, 0, '2016-03-08', 8, 55),
(12, 'S1032324E', 'Gerald Coleman', 'Juju', 2, 6, 2, 0, 1, 0, '2016-03-15', 1, 35),
(13, 'S6425983E', 'John Lam', 'Gogo', 4, 1, 0, 1, 1, 1, '2016-03-16', 2, 115),
(14, 'S4535043B', 'Andrea Hall', 'Momo', 5, 2, 0, 1, 0, 0, '2016-03-21', 3, 80),
(15, 'S5869940B', 'Christine Washington', 'Zaza', 5, 7, 2, 1, 1, 0, '2016-03-24', 2, 135),
(16, 'S2483793J', 'Katherine Cooper', 'Xoxo', 4, 3, 2, 1, 0, 1, '2016-03-29', 2, 110),
(17, 'S7265148D', 'Anthony Ward', 'Momo', 5, 4, 2, 1, 1, 0, '2016-04-27', 2, 85),
(18, 'S7802515A', 'Martha Bennett', 'Kaka', 3, 2, 2, 1, 0, 0, '2016-05-01', 2, 50),
(19, 'S4368974H', 'Kathleen Patterson', 'Lulu', 5, 3, 2, 0, 1, 0, '2016-05-02', 1, 130),
(20, 'S2150438J', 'Eugene Roberts', 'Wowo', 4, 5, 0, 1, 1, 0, '2016-05-07', 5, 110),
(21, 'S4330104G', 'Alice Johnson', 'Mumu', 4, 7, 1, 0, 0, 0, '2016-05-12', 3, 100),
(22, 'S7671056A', 'Heather Barnes', 'Lele', 1, 5, 2, 0, 0, 0, '2016-05-13', 2, 25),
(23, 'S4743019J', 'Tammy Perry', 'Cucu', 4, 1, 2, 0, 0, 0, '2016-05-19', 6, 100),
(24, 'S3437226G', 'Lisa Murphy', 'Meme', 5, 1, 1, 0, 1, 1, '2016-05-27', 3, 135),
(25, 'S7663137A', 'Ronald Garcia', 'Jiji', 4, 1, 0, 0, 1, 1, '2016-06-01', 5, 110),
(26, 'S8833349B', 'Robert Griffin', 'Susu', 4, 5, 1, 1, 1, 0, '2016-06-06', 5, 110),
(27, 'S6242434C', 'Frank Taylor', 'Vuvu', 5, 2, 2, 1, 0, 0, '2016-06-10', 10, 80),
(28, 'S5643133H', 'Kathy Reed', 'Roro', 4, 6, 0, 0, 0, 0, '2016-06-27', 3, 60),
(29, 'S8577046G', 'Rebecca Hernandez', 'Veve', 2, 7, 0, 0, 0, 1, '2016-08-04', 5, 55),
(30, 'S2560811E', 'Shirley Nelson', 'Lele', 1, 4, 0, 1, 1, 1, '2016-08-12', 10, 30),
(31, 'S2995445I', 'Keith Sanchez', 'Haha', 3, 3, 1, 0, 0, 0, '2016-08-26', 8, 75),
(32, 'S8201191J', 'Kevin Russell', 'Yeye', 1, 7, 0, 1, 1, 0, '2016-08-31', 2, 35),
(33, 'S1680889F', 'Bruce Collins', 'Kuku', 5, 6, 0, 1, 0, 1, '2016-09-09', 6, 85),
(34, 'S3308201F', 'Shawn Rivera', 'Lele', 3, 1, 1, 1, 1, 1, '2016-09-22', 5, 90),
(35, 'S5346688H', 'George Bell', 'Gogo', 1, 7, 2, 0, 0, 0, '2016-09-25', 3, 25),
(36, 'S2406904E', 'Lori Lee', 'Nunu', 4, 2, 2, 1, 1, 0, '2016-09-29', 3, 70),
(37, 'S1359972G', 'Roy Gonzalez', 'Qiqi', 4, 4, 1, 0, 1, 1, '2016-10-27', 10, 70),
(38, 'S8957263B', 'Jane Thomas', 'Koko', 4, 1, 1, 1, 0, 1, '2016-11-05', 3, 110),
(39, 'S7188345G', 'Jimmy Peterson', 'Fafa', 4, 4, 1, 1, 1, 0, '2016-11-08', 10, 70),
(40, 'S4494676H', 'Johnny Ramirez', 'Gege', 3, 4, 1, 1, 1, 1, '2016-11-20', 2, 60),
(41, 'S3778262D', 'Louis Wilson', 'Hihi', 4, 5, 1, 1, 0, 1, '2016-11-27', 3, 110),
(42, 'S7044732F', 'Judith Butler', 'Mimi', 1, 6, 1, 0, 0, 1, '2016-11-29', 9, 20),
(43, 'S2743507J', 'Angela Gonzales', 'Gigi', 4, 2, 2, 1, 0, 0, '2016-12-08', 5, 65),
(44, 'S9556880C', 'Brenda Edwards', 'Papa', 3, 1, 1, 1, 0, 1, '2016-12-12', 5, 85),
(45, 'S1850424J', 'Carlos Hill', 'Mumu', 4, 5, 1, 0, 0, 0, '2016-12-13', 9, 100),
(46, 'S2789334F', 'Barbara Brown', 'Mumu', 3, 5, 0, 1, 1, 0, '2016-12-25', 1, 85),
(47, 'S7903862J', 'Sara Moore', 'Lili', 1, 5, 2, 0, 1, 1, '2016-12-27', 9, 35),
(48, 'S5617165J', 'Emily Young', 'Caca', 3, 6, 2, 1, 0, 0, '2016-11-17', 3, 50),
(49, 'S7970456D', 'Dang Lang', 'Pepe', 2, 2, 0, 1, 1, 0, '2016-11-17', 1, 40),
(50, 'S6255957C', 'Nicol Ta', 'Titi', 4, 7, 1, 1, 0, 1, '2016-12-17', 3, 110)
SET IDENTITY_INSERT PHBooking OFF