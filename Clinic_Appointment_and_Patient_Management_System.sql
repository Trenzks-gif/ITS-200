-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2026 at 10:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` varchar(20) DEFAULT NULL,
  `reason_for_visit` varchar(255) NOT NULL,
  `appointment_status` varchar(20) NOT NULL,
  `notes` varchar(256) DEFAULT NULL
) ;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_date`, `appointment_time`, `reason_for_visit`, `appointment_status`, `notes`) VALUES
(1, 1, 1, '2026-11-04', '09:00:00', 'Fever and cough for 3 days', 'Completed', 'Patient requested morning slot'),
(2, 2, 3, '2026-11-10', '10:30:00', 'Chest discomfort', 'Scheduled', 'Bring previous ECG results'),
(3, 3, 2, '2026-11-05', '13:00:00', 'Child vaccination', 'Completed', NULL),
(4, 4, 6, '2026-11-07', '09:30:00', 'Knee pain after jogging', 'Completed', 'Possible sprain'),
(5, 5, 4, '2026-11-04', '11:00:00', 'Skin rash and itching', 'Completed', 'Allergy history noted'),
(6, 6, 2, '2026-11-11', '14:00:00', 'Stomach ache and fever', 'Scheduled', NULL),
(7, 7, 5, '2026-11-10', '09:00:00', 'Prenatal check-up', 'Scheduled', 'Second trimester'),
(8, 8, 1, '2026-11-12', '10:00:00', 'MonthlyPhysical exam', 'Completed', NULL),
(9, 9, 3, '2026-11-12', '15:00:00', 'High blood pressure follow-up', 'Scheduled', 'Monitor BP daily'),
(10, 10, 6, '2026-11-10', '09:00:00', 'Basketball Ankle sprain ', 'Scheduled', NULL),
(11, 1, 4, '2026-11-06', '11:30:00', 'Annual Acne treatment ', 'Completed', NULL),
(12, 2, 7, '2026-11-13', '14:30:00', 'Headache and dizziness', 'Completed', 'Hydration advised');

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `consultation_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `symptoms` varchar(256) NOT NULL,
  `diagnosis` varchar(256) NOT NULL,
  `medical_notes` varchar(256) DEFAULT NULL,
  `treatment_recommendations` varchar(256) DEFAULT NULL,
  `consultation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`consultation_id`, `appointment_id`, `symptoms`, `diagnosis`, `medical_notes`, `treatment_recommendations`, `consultation_date`) VALUES
(1, 1, 'Fever, cough, sore throat', 'Viral upper respiratory infection', 'Throat mildly inflamed, lungs clear', 'Rest, fluids, paracetamol as needed', '2026-11-04'),
(2, 2, 'Chest tightness, shortness of breath on exertion', 'Stable angina, Hypertension', 'BP 140/90, ECG ordered', 'Low-salt diet, continue maintenance meds, follow-up in 2 weeks', '2026-11-10'),
(3, 5, 'Red itchy patches on arms', 'Allergic contact dermatitis', 'No signs of infection', 'Avoid trigger, antihistamine, topical cream', '2026-11-04'),
(4, 8, 'No symptoms, for routine check', 'Normal physical exam', 'Vitals normal, labs requested', 'Continue healthy lifestyle, annual labs', '2026-11-12'),
(5, 9, 'Headache, occasional dizziness', 'Uncontrolled hypertension', 'BP 150/95 on visit', 'Adjust medication, low-salt diet, BP monitoring', '2026-11-12'),
(6, 12, 'Headache, dizziness, fatigue', 'Dehydration and migraine', 'Neurological exam normal', 'Increase fluid intake, rest, pain reliever as needed', '2026-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `consultation_fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `specialty_id`, `full_name`, `license_number`, `email`, `contact_number`, `consultation_fee`) VALUES
(1, 1, 'Dr. Denzemiel Ethan S. Dacillo', 'LIC-10001', 'denzemielethandacillo@gmail.com', '09171234101', 500.00),
(2, 2, 'Dr. Denemiel Nathan S. Dacillo', 'LIC-10002', 'denemielnathandacillo@gmail.com', '09171234102', 600.00),
(3, 3, 'Dr. Christoff Allen B. Jumapit', 'LIC-10003', 'ChristoffAllenJumapit@gmail.com', '09171234103', 1200.00),
(4, 4, 'Dr. Jelres C. Romano', 'LIC-10004', 'Jelres.Romano@gmail.com', '09171234104', 800.00),
(5, 5, 'Dr. Ildefonso D. Providencia', 'LIC-10005', 'Ildefonso.Providencia@gmail.com', '09171234105', 900.00),
(6, 6, 'Dr. John Carl T. Acibo', 'LIC-10006', 'John.Acibo@gmail.com', '09171234106', 1000.00),
(7, 1, 'Dr. Elena Cruz', 'LIC-10007', 'elena.cruz@gmail.com', '09171234107', 550.00),
(8, 2, 'Dr. Samuel Chua', 'LIC-10008', 'samuel.chua@gmail.com', '09171234108', 650.00);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `emergency_contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `full_name`, `date_of_birth`, `gender`, `address`, `contact_number`, `email`, `emergency_contact`) VALUES
(1, 'Maria Santos', '1995-03-12', 'Female', 'Molo, Iloilo City', '09171234001', 'maria.santos@gmail.com', '09181234001'),
(2, 'Juan Dela Cruz', '1988-07-25', 'Male', 'Jaro, Iloilo City', '09221234002', 'juan.delacruz@gmail.com', '09231234002'),
(3, 'Ana Reyes', '2001-11-08', 'Female', 'La Paz, Iloilo City', '09351234003', 'ana.reyes@gmail.com', '09361234003'),
(4, 'Jose Rizal Jr.', '1975-01-15', 'Male', 'Mandurriao, Iloilo City', '09451234004', 'jose.rizaljr@gmail.com', '09461234004'),
(5, 'Liza Villanueva', '1999-06-30', 'Female', 'Arevalo, Iloilo City', '09561234005', 'liza.villanueva@gmail.com', '09571234005'),
(6, 'Mark Bautista', '2010-09-14', 'Male', 'City Proper, Iloilo City', '09671234006', 'mark.bautista@gmail.com', '09681234006'),
(7, 'Sofia Lim', '1985-12-02', 'Female', 'Pavia, Iloilo', '09771234007', 'sofia.lim@gmail.com', '09781234007'),
(8, 'Carlos Mendoza', '1992-04-20', 'Male', 'Oton, Iloilo', '09881234008', 'carlos.mendoza@gmail.com', '09891234008'),
(9, 'Grace Tan', '1978-08-18', 'Female', 'Leganes, Iloilo', '09991234009', 'grace.tan@gmail.com', '09001234009'),
(10, 'Paolo Garcia', '2005-02-27', 'Male', 'Santa Barbara, Iloilo', '09111234010', 'paolo.garcia@gmail.com', '09121234010');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `prescription_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `medication` varchar(100) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `frequency` varchar(100) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `instructions` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`prescription_id`, `consultation_id`, `medication`, `dosage`, `frequency`, `duration`, `instructions`) VALUES
(1, 1, 'Paracetamol', '500mg', 'Every 6 hours as needed', '3 days', 'Take after meals if fever or pain persists'),
(2, 2, 'Amlodipine', '5mg', 'Once daily', '30 days', 'Take at the same time daily, monitor BP'),
(3, 2, 'Aspirin', '80mg', 'Once daily', '30 days', 'Take after meals'),
(4, 3, 'Cetirizine', '10mg', 'Once daily at bedtime', '7 days', 'May cause drowsiness'),
(5, 3, 'Hydrocortisone Cream 1%', 'Apply thin layer', 'Twice daily', '7 days', 'Apply only on affected area, do not use on face'),
(6, 5, 'Losartan', '50mg', 'Once daily', '30 days', 'Take in the morning, check BP weekly'),
(7, 6, 'Ibuprofen', '400mg', 'Every 8 hours as needed', '3 days', 'Take with food, stop if stomach pain occurs'),
(8, 4, 'Multivitamins', '1 tablet', 'Once daily', '30 days', 'Take after breakfast');

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `specialty_id` int(11) NOT NULL,
  `specialty_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`specialty_id`, `specialty_name`) VALUES
(3, 'Cardiology'),
(4, 'Dermatology'),
(1, 'General Medicine'),
(5, 'Obstetrics and Gynecology'),
(6, 'Orthopedics'),
(2, 'Pediatrics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD UNIQUE KEY `uq_doctor_schedule` (`doctor_id`,`appointment_date`,`appointment_time`),
  ADD KEY `fk_appointment_patient` (`patient_id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`consultation_id`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD UNIQUE KEY `license_number` (`license_number`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_doctor_specialty` (`specialty_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `fk_prescription_consultation` (`consultation_id`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`specialty_id`),
  ADD UNIQUE KEY `specialty_name` (`specialty_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `consultation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `specialty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON UPDATE CASCADE;

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `fk_consultation_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `fk_doctor_specialty` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`specialty_id`) ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `fk_prescription_consultation` FOREIGN KEY (`consultation_id`) REFERENCES `consultations` (`consultation_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
