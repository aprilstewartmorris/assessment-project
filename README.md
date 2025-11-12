# Order Management System - Technical Assessment

Welcome to the Order Management System assessment project! This is designed to evaluate your full-stack development skills with Java Spring Boot and React.

## 📋 Overview

This application is an order management system with **intentional code quality issues**. Your task is to:
1. **Review the code** and identify issues (Part A)
2. **Fix critical issues** and implement a new feature (Part B)

## 🛠 Tech Stack

**Backend:**
- Java 11
- Spring Boot 2.7.14
- Spring Data JPA
- PostgreSQL 14
- Maven

**Frontend:**
- React 18
- Axios
- Modern JavaScript (ES6+)

## 📦 Prerequisites

Before starting, ensure you have installed:
- **Java 11 or higher** ([Download](https://adoptium.net/))
- **Node.js 16+** and npm ([Download](https://nodejs.org/))
- **Docker & Docker Compose** ([Download](https://www.docker.com/products/docker-desktop))
- **Git** ([Download](https://git-scm.com/))

## 🚀 Quick Start Guide

### Step 1: Start the Database

Open a terminal in the project root directory and run:

```bash
docker-compose up -d
```

Verify the database is running:
```bash
docker ps
```

You should see `assessment-db` running on port 5432.

### Step 2: Start the Backend

Open a new terminal, navigate to the backend folder, and run:

```bash
cd backend
./mvnw clean install
./mvnw spring-boot:run
```

**Windows users:** Use `mvnw.cmd` instead of `./mvnw`

The backend will start on **http://localhost:8080**

Wait until you see: `Started OrderApplication in X seconds`

### Step 3: Start the Frontend

Open another terminal, navigate to the frontend folder, and run:

```bash
cd frontend
npm install
npm start
```

The frontend will automatically open in your browser at **http://localhost:3000**

### Step 4: Verify Everything Works

1. You should see a list of sample orders
2. Try searching for a customer name
3. Try changing an order status
4. Everything should work (despite the code issues!)

## 📁 Project Structure

```
assessment-project/
├── backend/                    # Spring Boot application
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/          # Java source code
│   │   │   └── resources/     # Configuration files
│   │   └── test/              # Unit tests
│   └── pom.xml                # Maven dependencies
├── frontend/                   # React application
│   ├── src/
│   │   ├── components/        # React components
│   │   └── services/          # API service
│   └── package.json           # npm dependencies
└── docker-compose.yml         # Database configuration
```

## 📝 Assessment Instructions

**Time Allocation:** 2-3 hours total
- Part A: 45 minutes
- Part B: 1.5-2 hours

Please read **ASSESSMENT_INSTRUCTIONS.md** for detailed requirements.

### Part A: Code Review (45 minutes)

Review the codebase and document issues in **CODE_REVIEW.md**

Focus on:
- Backend issues (OrderController.java, OrderService.java)
- Frontend issues (OrdersList.jsx)
- Security vulnerabilities
- Performance problems
- Poor practices

### Part B: Implementation (1.5-2 hours)

1. Fix 2-3 critical issues from Part A
2. Implement the bulk order status update feature
3. Document your work in **IMPLEMENTATION_NOTES.md**

## 🔍 API Endpoints

### Orders
- `GET /api/orders` - Get all orders
- `GET /api/orders/{id}` - Get order by ID
- `GET /api/orders/search?customerName={name}` - Search orders
- `POST /api/orders` - Create new order
- `PUT /api/orders/{id}/status?status={status}` - Update order status
- `DELETE /api/orders/{id}` - Delete order

## 🐛 Troubleshooting

### Database Connection Issues
```bash
# Check if database is running
docker ps

# View database logs
docker logs assessment-db

# Restart database
docker-compose down
docker-compose up -d
```

### Backend Won't Start

```bash
# Check Java version (must be 11+)
java -version

# Clean and rebuild
cd backend
./mvnw clean install

# Check if port 8080 is already in use
# Windows: netstat -ano | findstr :8080
# Mac/Linux: lsof -i :8080
```

### Frontend Issues

```bash
# Clear npm cache and reinstall
cd frontend
rm -rf node_modules package-lock.json
npm cache clean --force
npm install

# Check if port 3000 is already in use
# Windows: netstat -ano | findstr :3000
# Mac/Linux: lsof -i :3000
```

### CORS Errors
- Ensure backend is running on port **8080**
- Ensure frontend is running on port **3000**
- Check browser console for specific errors

### "Cannot connect to database" Error
```bash
# Make sure Docker is running
docker --version

# Check database is healthy
docker-compose ps

# Try restarting
docker-compose restart
```

## ✅ Submission Checklist

Before submitting, ensure you have:

- [ ] Completed **CODE_REVIEW.md** with 5-7 issues identified
- [ ] Fixed 2-3 critical issues from your code review
- [ ] Implemented bulk order status update (backend + frontend)
- [ ] Completed **IMPLEMENTATION_NOTES.md** with explanations
- [ ] Tested your implementation thoroughly
- [ ] Committed all changes with clear commit messages
- [ ] Pushed to your branch: `assessment/[your-name]`

## 📧 Questions?

If you encounter setup issues or have questions about requirements:

**Contact:** [RECRUITER_EMAIL]
**Response Time:** Within 24 hours

## ⚠️ Important Notes

- This is a **controlled environment** with intentional code issues
- Focus on demonstrating problem-solving and code quality awareness
- Time management is important - don't aim for perfection
- Document assumptions if requirements are unclear
- Working code is better than perfect code

## 🎯 What We're Evaluating

- **Code Review Skills:** Can you identify real issues?
- **Problem Solving:** How do you approach fixes?
- **Full-Stack Skills:** Backend and frontend proficiency
- **Code Quality:** Clean, maintainable code
- **Communication:** Clear documentation

---

**Good luck! We're excited to see your approach to this challenge.**
