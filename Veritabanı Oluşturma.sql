CREATE DATABASE obs;
use obs;
-- Kullanıcılar Tablosu
CREATE TABLE users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    KullaniciAdi VARCHAR(50) NOT NULL,
    Parola VARCHAR(255) NOT NULL,
    AdSoyad VARCHAR(100) NOT NULL,
    EPosta VARCHAR(100) NOT NULL,
    KullaniciTipi VARCHAR(50) NOT NULL
);



-- Öğretmenler Tablosu
CREATE TABLE teachers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    KullaniciID INT,
    FOREIGN KEY (KullaniciID) REFERENCES users(ID)
);

-- Öğrenciler Tablosu
CREATE TABLE students (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    KullaniciID INT,
    OgrenciNo VARCHAR(20) NOT NULL,
	DanismanID INT,
    FOREIGN KEY (KullaniciID) REFERENCES users(ID),
    FOREIGN KEY (DanismanID) REFERENCES teachers(ID)
);


-- Mühendislik Bölümleri
CREATE TABLE engineeringdepartments (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BolumAdi VARCHAR(100) NOT NULL
);

-- Dersler Tablosu
CREATE TABLE courses (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DersAdi VARCHAR(100) NOT NULL,
    DersKodu VARCHAR(20) NOT NULL,
    OgretmenID INT,
    BolumID INT,
    DersSaati VARCHAR(100),
	DersGunu VARCHAR(100),
    DersYeri VARCHAR(100),
    FOREIGN KEY (OgretmenID) REFERENCES teachers(ID),
	FOREIGN KEY (BolumID) REFERENCES engineeringdepartments(ID)
);

-- Öğrenciler ve Derslerin ilişkilendirildiği tablo
CREATE TABLE studentcourse (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OgrenciID INT,
    DersID INT,
    FOREIGN KEY (OgrenciID) REFERENCES students(ID),
    FOREIGN KEY (DersID) REFERENCES courses(ID)
);

-- Öğretmenler ve Derslerin ilişkilendirildiği tablo
CREATE TABLE teachercourse (
    OgretmenDersID INT AUTO_INCREMENT PRIMARY KEY,
    OgretmenID INT,
    DersID INT,
    FOREIGN KEY (OgretmenID) REFERENCES teachers(ID),
    FOREIGN KEY (DersID) REFERENCES courses(ID)
);

