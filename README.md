# Enterprise Management System

Sistema gestionale multi-tier sviluppato come progetto personale, per gestire utenti, prodotti e ordini con un backend REST, client desktop e database relazionale.

---

## 🧰 Tecnologie

- **Backend**: Java, Spring Boot, REST API, JPA/Hibernate  
- **Client Desktop**: C# (.NET, WPF)  
- **Modulo Calcolo**: C++  
- **Database**: PostgreSQL  
- **Controllo Versione**: Git + GitHub  

---
## 🏗️ Architettura
[Client Desktop C#] ---> [Backend Java (REST API)] ---> [Database PostgreSQL]
|
---> [Modulo C++ per calcoli ad alte prestazioni]

- Il client desktop comunica con il backend tramite API REST  
- Il backend gestisce la logica di business e il database  
- Il modulo C++ è chiamato dal backend per elaborazioni intensive  

---

## ⚡ Feature Principali

- Autenticazione utenti con ruoli (ADMIN / USER)  
- CRUD completo per Prodotti e Ordini  
- Logging operazioni  
- Database progettato con tabelle normalizzate, viste, indici e transazioni  
- Integrazione multi-linguaggio (Java, C#, C++)  

---

## 💾 Database

- File SQL: `database/databaseEMS.sql`  
- Contiene: tabelle utenti, prodotti, ordini, dettagli_ordini, log_operazioni  
- Include viste e indici per ottimizzazione query  

---

## 🚀 Avvio Progetto

### 1️⃣ Backend Java
1. Apri la cartella `backend-java` con IntelliJ/Eclipse  
2. Importa come progetto Maven  
3. Modifica `src/main/resources/application.properties` con le credenziali PostgreSQL  
4. Avvia `BackendJavaApplication.java`  

### 2️⃣ Client Desktop C#
1. Apri la soluzione Visual Studio in `desktop-csharp`  
2. Configura eventuale URL API (localhost:8080)  
3. Avvia l’applicazione  

### 3️⃣ Modulo C++
- Inclusione nel backend Java per calcoli specifici (ad esempio: analisi vendite, previsione stock)

---

## 📌 Struttura Repository
enterprise-management-system/
│
├── backend-java/ # Progetto Spring Boot
├── desktop-csharp/ # Client desktop .NET WPF
├── module-cpp/ # Modulo C++ per calcoli
├── database/ # Script SQL del database
│ └── databaseEMS.sql
└── README.md

---

## 👨‍💻 Autore
- [Edoardo Comini]
- Email: edocomini03@gmail.com
- GitHub: https://github.com/EdoardoComini


