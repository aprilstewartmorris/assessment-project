#!/bin/bash

# Assessment Project Setup Script
# This script creates all necessary files for the full-stack assessment project

echo "🚀 Starting Assessment Project Setup..."

# Check if we're in the assessment-project directory
if [ ! -d "backend" ] || [ ! -d "frontend" ]; then
    echo "❌ Error: Please run this script from the assessment-project directory"
    echo "   Make sure you've created the directory structure first"
    exit 1
fi

echo "📁 Creating root directory files..."

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  postgres:
    image: postgres:14
    container_name: assessment-db
    environment:
      POSTGRES_DB: orderdb
      POSTGRES_USER: dbuser
      POSTGRES_PASSWORD: dbpass
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U dbuser -d orderdb"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  postgres_data:
    driver: local
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Backend
backend/target/
backend/.mvn/wrapper/maven-wrapper.jar
*.class
*.jar
*.war
*.ear
*.log

# Frontend
frontend/node_modules/
frontend/build/
frontend/.env.local
frontend/.env.development.local
frontend/.env.test.local
frontend/.env.production.local
frontend/npm-debug.log*
frontend/yarn-debug.log*
frontend/yarn-error.log*

# IDE
.idea/
.vscode/
*.iml
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Database
*.db
*.sqlite

# Docker
docker-compose.override.yml
EOF

# Create CODE_REVIEW.md template
cat > CODE_REVIEW.md << 'EOF'
# Code Review - Part A

**Candidate Name:** [Your Name]  
**Date:** [Date]

## Instructions
Document 5-7 significant issues you've identified in the codebase. For each issue, provide:
1. Location (file and line number)
2. Issue description
3. Impact/why it matters
4. Suggested fix

---

## Issue #1: [Title]

**Location:** `[FileName.java:LineNumber]`

**Issue Description:**
[Describe what's wrong]

**Impact:**
[Why this matters - performance, security, maintainability, etc.]

**Suggested Fix:**
[How you would improve it]

---

## Issue #2: [Title]

**Location:** `[FileName.jsx:LineNumber]`

**Issue Description:**
[Describe what's wrong]

**Impact:**
[Why this matters]

**Suggested Fix:**
[How you would improve it]

---

## Issue #3: [Title]

[Continue pattern...]

---

## Issue #4: [Title]

[Continue pattern...]

---

## Issue #5: [Title]

[Continue pattern...]

---

## Additional Issues (Optional)

### Issue #6: [Title]
[Brief description]

### Issue #7: [Title]
[Brief description]

---

## Overall Code Quality Assessment

**Strengths:**
- [What's done well]

**Priority Areas for Improvement:**
1. [Highest priority issue]
2. [Second priority]
3. [Third priority]
EOF

# Create IMPLEMENTATION_NOTES.md template
cat > IMPLEMENTATION_NOTES.md << 'EOF'
# Implementation Notes - Part B

**Candidate Name:** [Your Name]  
**Date:** [Date]  
**Time Spent:** [Hours]

---

## Section 1: Bug Fixes

### Issues Fixed

#### Fix #1: [Issue Title from Part A]

**Original Problem:**
[Brief recap of the issue]

**Solution Implemented:**
[Describe your fix]

**Files Modified:**
- `[filename]` - [what was changed]

**Reasoning:**
[Why you chose this approach]

**Trade-offs/Considerations:**
[Any compromises or alternative approaches considered]

---

#### Fix #2: [Issue Title from Part A]

[Same format as above]

---

#### Fix #3: [Issue Title from Part A]

[Same format as above]

---

## Section 2: New Feature Implementation

### Bulk Order Status Update

#### Backend Implementation

**Endpoint Created:**
- Method: `PUT`
- Path: `/api/orders/bulk-status`
- Request/Response format: [Describe]

**Key Components:**

1. **Controller Layer** (`[filename]`)
   - [What was added/changed]

2. **Service Layer** (`[filename]`)
   - [What was added/changed]

3. **Validation Logic**
   - [Describe validation rules implemented]

4. **Transaction Management**
   - [How you handled transactions]

**Error Handling:**
[Describe your error handling approach]

---

#### Frontend Implementation

**Components Modified/Created:**
- `[component name]` - [purpose]

**Key Features:**

1. **Bulk Selection UI**
   - [Describe implementation]

2. **Status Update Functionality**
   - [Describe implementation]

3. **Optimistic Updates**
   - [How you implemented this]

4. **User Feedback**
   - Success messages: [approach]
   - Error messages: [approach]

**State Management:**
[Describe how you managed component state]

---

## Section 3: Testing

**Manual Testing Performed:**
- [ ] Bulk selection works with multiple orders
- [ ] Status updates succeed for valid transitions
- [ ] Validation prevents invalid status changes
- [ ] Error messages display correctly
- [ ] UI updates optimistically
- [ ] Rollback works on error
- [ ] [Other test cases]

**Test Scenarios Covered:**
1. [Scenario description] - Result: [Pass/Fail]
2. [Scenario description] - Result: [Pass/Fail]
3. [Scenario description] - Result: [Pass/Fail]

---

## Section 4: Assumptions & Design Decisions

1. **[Assumption/Decision]**
   - Reasoning: [Why]
   
2. **[Assumption/Decision]**
   - Reasoning: [Why]

3. **[Assumption/Decision]**
   - Reasoning: [Why]

---

## Section 5: Known Limitations & Future Improvements

**Current Limitations:**
1. [Limitation] - [Why it exists]
2. [Limitation] - [Why it exists]

**If I Had More Time, I Would:**
1. [Improvement] - [Why/how]
2. [Improvement] - [Why/how]
3. [Improvement] - [Why/how]

---

## Section 6: Code Quality Checklist

- [ ] Code follows consistent style
- [ ] Meaningful variable/function names used
- [ ] Comments added where necessary
- [ ] No console.log() statements left in production code
- [ ] Error handling is comprehensive
- [ ] Code is DRY (Don't Repeat Yourself)
- [ ] Functions are single-purpose
- [ ] No hardcoded values (used constants where appropriate)

---

## Additional Notes

[Any other information you want to share about your implementation]
EOF

echo "📝 Creating README.md..."

cat > README.md << 'EOF'
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
EOF

echo "📄 Creating ASSESSMENT_INSTRUCTIONS.md..."

cat > ASSESSMENT_INSTRUCTIONS.md << 'EOF'
# Full-Stack Developer Assessment
## Code Review & Enhancement Exercise

**Candidate Name:** _________________________  
**Time Allocation:** 2-3 hours total
- Part A: 45 minutes
- Part B: 1.5-2 hours

---

## Important Guidelines

- This assessment evaluates **practical skills**, not perfection
- Focus on demonstrating your **problem-solving approach** and **code quality awareness**
- **Time management** is important - don't get stuck on one issue
- **Document your assumptions** if anything is unclear
- **Working code** is better than perfect code

---

## Part A: Code Review (45 minutes)

### Objective
Review the provided codebase and identify issues in both backend and frontend code.

### What to Look For

**Backend Issues:**
- Security vulnerabilities (SQL injection, authentication, etc.)
- Performance problems (N+1 queries, missing indexes, etc.)
- Poor error handling
- Missing validation
- Transaction management issues
- Code quality and maintainability

**Frontend Issues:**
- React anti-patterns
- Performance issues (unnecessary re-renders, etc.)
- Missing error handling
- Poor state management
- Accessibility issues
- User experience problems

### Deliverable

Document your findings in **CODE_REVIEW.md**

For each issue, provide:
1. **Location:** File and line number
2. **Issue Description:** What's wrong?
3. **Impact:** Why does it matter? (security, performance, UX, etc.)
4. **Suggested Fix:** How would you improve it?

**Target:** Identify and document **5-7 significant issues**

---

## Part B: Implementation (1.5-2 hours)

### Task 1: Fix Critical Issues (30-45 minutes)

Select **2-3 of the most critical issues** from Part A and implement fixes.

### Task 2: Implement New Feature (1-1.5 hours)

**Feature: Bulk Order Status Update**

#### Business Requirement
Users need to update the status of multiple orders simultaneously.

#### Backend Requirements

**Create endpoint:** `PUT /api/orders/bulk-status`

**Request Body:**
```json
{
  "orderIds": [1, 2, 3, 4, 5],
  "newStatus": "SHIPPED"
}
```

**Response Format:**
```json
{
  "successful": [1, 2, 4],
  "failed": [
    {
      "orderId": 3,
      "reason": "Order is already cancelled"
    }
  ]
}
```

#### Frontend Requirements

- Add checkbox to each order row for bulk selection
- Add "Bulk Update Status" button with dropdown
- Implement optimistic UI updates
- Show loading states and error messages

---

## Submission Instructions

```bash
# Create your branch
git checkout -b assessment/[your-name]

# Commit your changes
git add .
git commit -m "Complete assessment"

# Push your branch
git push origin assessment/[your-name]
```

**Deadline:** [INSERT DEADLINE]

**Good luck!**
EOF

echo ""
echo "🔧 Creating Backend files..."

# Create pom.xml
cat > backend/pom.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.14</version>
        <relativePath/>
    </parent>
    
    <groupId>com.assessment</groupId>
    <artifactId>order-service</artifactId>
    <version>1.0.0</version>
    <name>Order Service Assessment</name>
    <description>Assessment project for full-stack developer</description>
    
    <properties>
        <java.version>11</java.version>
    </properties>
    
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <scope>runtime</scope>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>
                            <groupId>org.projectlombok</groupId>
                            <artifactId>lombok</artifactId>
                        </exclude>
                    </excludes>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# Create maven wrapper properties
cat > backend/.mvn/wrapper/maven-wrapper.properties << 'EOF'
distributionUrl=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.8.6/apache-maven-3.8.6-bin.zip
wrapperUrl=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar
EOF

# Create application.properties
cat > backend/src/main/resources/application.properties << 'EOF'
# Server Configuration
server.port=8080

# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/orderdb
spring.datasource.username=dbuser
spring.datasource.password=dbpass
spring.datasource.driver-class-name=org.postgresql.Driver

# JPA/Hibernate Configuration
spring.jpa.hibernate.ddl-auto=create-drop
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect

# Initialize with sample data
spring.jpa.defer-datasource-initialization=true
spring.sql.init.mode=always

# Logging
logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
EOF

# Create data.sql
cat > backend/src/main/resources/data.sql << 'EOF'
-- Sample orders
INSERT INTO orders (id, customer_name, status, total, created_at) VALUES 
(1, 'John Smith', 'PENDING', 150.00, CURRENT_TIMESTAMP),
(2, 'Jane Doe', 'PROCESSING', 275.50, CURRENT_TIMESTAMP),
(3, 'Bob Johnson', 'SHIPPED', 89.99, CURRENT_TIMESTAMP),
(4, 'Alice Williams', 'DELIVERED', 420.00, CURRENT_TIMESTAMP),
(5, 'Charlie Brown', 'PENDING', 55.25, CURRENT_TIMESTAMP),
(6, 'David Miller', 'PROCESSING', 199.99, CURRENT_TIMESTAMP),
(7, 'Emma Davis', 'SHIPPED', 340.50, CURRENT_TIMESTAMP),
(8, 'Frank Wilson', 'PENDING', 125.75, CURRENT_TIMESTAMP);

-- Sample order items
INSERT INTO order_items (id, order_id, product_name, quantity, price) VALUES
(1, 1, 'Widget A', 2, 50.00),
(2, 1, 'Widget B', 1, 50.00),
(3, 2, 'Gadget X', 3, 75.00),
(4, 2, 'Gadget Y', 1, 50.50),
(5, 3, 'Tool Z', 1, 89.99),
(6, 4, 'Device Pro', 2, 210.00),
(7, 5, 'Accessory', 5, 11.05),
(8, 6, 'Component A', 4, 49.99),
(9, 7, 'Premium Widget', 3, 113.50),
(10, 8, 'Standard Tool', 2, 62.87);

-- Reset sequences
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));
EOF

echo "Creating Java source files..."

# Create OrderApplication.java
cat > backend/src/main/java/com/assessment/order/OrderApplication.java << 'EOF'
package com.assessment.order;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OrderApplication {
    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class, args);
    }
}
EOF

# Create CorsConfig.java
cat > backend/src/main/java/com/assessment/order/config/CorsConfig.java << 'EOF'
package com.assessment.order.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig {
    
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/api/**")
                        .allowedOrigins("http://localhost:3000")
                        .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        .allowedHeaders("*")
                        .allowCredentials(true);
            }
        };
    }
}
EOF

# Create Order.java (model)
cat > backend/src/main/java/com/assessment/order/model/Order.java << 'EOF'
package com.assessment.order.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "customer_name", nullable = false)
    private String customerName;
    
    @Column(nullable = false)
    private String status;
    
    @Column(nullable = false)
    private Double total;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private List<OrderItem> orderItems = new ArrayList<>();
    
    public Order() {
        this.createdAt = LocalDateTime.now();
    }
    
    public Order(String customerName, String status, Double total) {
        this.customerName = customerName;
        this.status = status;
        this.total = total;
        this.createdAt = LocalDateTime.now();
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getCustomerName() {
        return customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Double getTotal() {
        return total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public List<OrderItem> getOrderItems() {
        return orderItems;
    }
    
    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
EOF

# Create OrderItem.java
cat > backend/src/main/java/com/assessment/order/model/OrderItem.java << 'EOF'
package com.assessment.order.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    @JsonBackReference
    private Order order;
    
    @Column(name = "product_name", nullable = false)
    private String productName;
    
    @Column(nullable = false)
    private Integer quantity;
    
    @Column(nullable = false)
    private Double price;
    
    public OrderItem() {}
    
    public OrderItem(String productName, Integer quantity, Double price) {
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Order getOrder() {
        return order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }
    
    public String getProductName() {
        return productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public Integer getQuantity() {
        return quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    public Double getPrice() {
        return price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
}
EOF

# Create OrderRepository.java
cat > backend/src/main/java/com/assessment/order/repository/OrderRepository.java << 'EOF'
package com.assessment.order.repository;

import com.assessment.order.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
EOF

# Create OrderItemRepository.java
cat > backend/src/main/java/com/assessment/order/repository/OrderItemRepository.java << 'EOF'
package com.assessment.order.repository;

import com.assessment.order.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}
EOF

# Create OrderService.java (with flaws)
cat > backend/src/main/java/com/assessment/order/service/OrderService.java << 'EOF'
package com.assessment.order.service;

import com.assessment.order.model.Order;
import com.assessment.order.model.OrderItem;
import com.assessment.order.repository.OrderRepository;
import com.assessment.order.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private EntityManager entityManager;

    // Issue: N+1 query problem - loads items separately for each order
    public List<Order> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        for (Order order : orders) {
            // This triggers a separate query for each order
            order.getOrderItems().size(); // Force lazy loading
        }
        return orders;
    }

    public Order getOrderById(Long id) {
        // Issue: Returns null instead of throwing exception
        return orderRepository.findById(id).orElse(null);
    }

    // Issue: SQL injection vulnerability - concatenating user input directly
    public List<Order> searchByCustomerName(String customerName) {
        String sql = "SELECT * FROM orders WHERE customer_name = '" + customerName + "'";
        Query query = entityManager.createNativeQuery(sql, Order.class);
        return query.getResultList();
    }

    // Issue: No transaction management, partial saves possible
    public Order createOrder(Order order) {
        Order savedOrder = orderRepository.save(order);
        
        // If this fails, order is saved but items aren't
        for (OrderItem item : order.getOrderItems()) {
            item.setOrder(savedOrder);
            orderItemRepository.save(item);
        }
        
        return savedOrder;
    }

    // Issue: No validation, no status transition rules
    public Order updateOrder(Order order) {
        return orderRepository.save(order);
    }

    // Issue: No check if order exists, no cascade delete handling
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }

    // Issue: Inefficient - loads entire order to calculate total
    public Double calculateOrderTotal(Long orderId) {
        Order order = getOrderById(orderId);
        double total = 0;
        for (OrderItem item : order.getOrderItems()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
}
EOF

# Create OrderController.java (with flaws)
cat > backend/src/main/java/com/assessment/order/controller/OrderController.java << 'EOF'
package com.assessment.order.controller;

import com.assessment.order.model.Order;
import com.assessment.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // Issue: No pagination, will load all orders into memory
    @GetMapping
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    // Issue: No validation, no error handling
    @GetMapping("/{id}")
    public Order getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }

    // Issue: SQL injection vulnerability through search parameter
    @GetMapping("/search")
    public List<Order> searchOrders(@RequestParam String customerName) {
        return orderService.searchByCustomerName(customerName);
    }

    // Issue: No request body validation, returns null on error
    @PostMapping
    public Order createOrder(@RequestBody Order order) {
        try {
            return orderService.createOrder(order);
        } catch (Exception e) {
            return null; // Bad error handling
        }
    }

    // Issue: No authorization check, anyone can update any order
    @PutMapping("/{id}/status")
    public Order updateStatus(@PathVariable Long id, @RequestParam String status) {
        Order order = orderService.getOrderById(id);
        order.setStatus(status); // No validation of status values
        return orderService.updateOrder(order);
    }

    // Issue: Hard delete without soft delete option, no cascade handling
    @DeleteMapping("/{id}")
    public void deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
    }
}
EOF

# Create test file
cat > backend/src/test/java/com/assessment/order/OrderApplicationTests.java << 'EOF'
package com.assessment.order;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class OrderApplicationTests {

    @Test
    void contextLoads() {
    }
}
EOF

echo ""
echo "⚛️  Creating Frontend files..."

# Create package.json
cat > frontend/package.json << 'EOF'
{
  "name": "order-management-frontend",
  "version": "1.0.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "axios": "^1.4.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "proxy": "http://localhost:8080"
}
EOF

# Create frontend .gitignore
cat > frontend/.gitignore << 'EOF'
# Dependencies
/node_modules
/.pnp
.pnp.js

# Testing
/coverage

# Production
/build

# Misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDE
.idea
.vscode
EOF

# Create index.html
cat > frontend/public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Order Management System - Assessment Project"
    />
    <title>Order Management System</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# Create index.js
cat > frontend/src/index.js << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# Create App.js
cat > frontend/src/App.js << 'EOF'
import React from 'react';
import OrdersList from './components/OrdersList';
import './App.css';

function App() {
  return (
    <div className="App">
      <OrdersList />
    </div>
  );
}

export default App;
EOF

# Create App.css
cat > frontend/src/App.css << 'EOF'
.App {
  min-height: 100vh;
  background-color: #f5f5f5;
}
EOF

# Create index.css
cat > frontend/src/index.css << 'EOF'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}
EOF

# Create api.js
cat > frontend/src/services/api.js << 'EOF'
import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api';

export const orderApi = {
  getAllOrders: () => axios.get(`${API_BASE_URL}/orders`),
  
  getOrderById: (id) => axios.get(`${API_BASE_URL}/orders/${id}`),
  
  searchOrders: (customerName) => 
    axios.get(`${API_BASE_URL}/orders/search`, { 
      params: { customerName } 
    }),
  
  createOrder: (order) => axios.post(`${API_BASE_URL}/orders`, order),
  
  updateOrderStatus: (id, status) => 
    axios.put(`${API_BASE_URL}/orders/${id}/status`, null, { 
      params: { status } 
    }),
  
  deleteOrder: (id) => axios.delete(`${API_BASE_URL}/orders/${id}`)
};

export default orderApi;
EOF

# Create OrdersList.jsx (with flaws)
cat > frontend/src/components/OrdersList.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import axios from 'axios';

// Issue: Component does too much, should be broken down
function OrdersList() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');

  // Issue: No error handling, no cleanup
  useEffect(() => {
    fetchOrders();
  }, []);

  // Issue: Fetches all orders every time, no caching
  const fetchOrders = async () => {
    setLoading(true);
    const response = await axios.get('http://localhost:8080/api/orders');
    setOrders(response.data);
    setLoading(false);
  };

  // Issue: Filtering happens on every render, should use useMemo
  const filteredOrders = orders.filter(order => 
    order.customerName.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Issue: No optimistic updates, no error feedback
  const handleStatusChange = async (orderId, newStatus) => {
    await axios.put(`http://localhost:8080/api/orders/${orderId}/status?status=${newStatus}`);
    // Issue: Refetches everything instead of updating single order
    fetchOrders();
  };

  // Issue: No confirmation, no error handling
  const handleDelete = async (orderId) => {
    await axios.delete(`http://localhost:8080/api/orders/${orderId}`);
    fetchOrders();
  };

  // Issue: Inline styles, no proper loading state UI
  if (loading) return <div>Loading...</div>;

  return (
    <div style={{ padding: '20px' }}>
      <h1>Orders Management</h1>
      
      {/* Issue: Uncontrolled input, updates on every keystroke without debounce */}
      <input
        type="text"
        placeholder="Search by customer name"
        onChange={(e) => setSearchTerm(e.target.value)}
        style={{ 
          marginBottom: '20px', 
          padding: '8px',
          width: '300px',
          fontSize: '14px'
        }}
      />

      {/* Issue: No virtualization for large lists */}
      <table style={{ 
        width: '100%', 
        borderCollapse: 'collapse',
        backgroundColor: 'white',
        boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
      }}>
        <thead>
          <tr style={{ backgroundColor: '#f8f9fa' }}>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Order ID</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Customer</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Status</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'right'
            }}>Total</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'center'
            }}>Actions</th>
          </tr>
        </thead>
        <tbody>
          {/* Issue: Key should not use index */}
          {filteredOrders.map((order, index) => (
            <OrderRow
              key={index}
              order={order}
              onStatusChange={handleStatusChange}
              onDelete={handleDelete}
            />
          ))}
        </tbody>
      </table>

      {filteredOrders.length === 0 && (
        <div style={{ 
          padding: '40px', 
          textAlign: 'center',
          color: '#666'
        }}>
          No orders found
        </div>
      )}
    </div>
  );
}

// Issue: Creates new functions on every render (prop drilling)
function OrderRow({ order, onStatusChange, onDelete }) {
  return (
    <tr style={{ borderBottom: '1px solid #eee' }}>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>{order.id}</td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>{order.customerName}</td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>
        {/* Issue: Hardcoded status options, no validation */}
        <select
          value={order.status}
          onChange={(e) => onStatusChange(order.id, e.target.value)}
          style={{
            padding: '6px 8px',
            border: '1px solid #ddd',
            borderRadius: '4px',
            fontSize: '14px'
          }}
        >
          <option value="PENDING">Pending</option>
          <option value="PROCESSING">Processing</option>
          <option value="SHIPPED">Shipped</option>
          <option value="DELIVERED">Delivered</option>
          <option value="CANCELLED">Cancelled</option>
        </select>
      </td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px',
        textAlign: 'right'
      }}>
        {/* Issue: No number formatting, assumes total exists */}
        ${order.total}
      </td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px',
        textAlign: 'center'
      }}>
        {/* Issue: Inconsistent styling, no accessibility */}
        <button 
          onClick={() => onDelete(order.id)}
          style={{
            padding: '6px 12px',
            backgroundColor: '#dc3545',
            color: 'white',
            border: 'none',
            borderRadius: '4px',
            cursor: 'pointer',
            fontSize: '14px'
          }}
        >
          Delete
        </button>
      </td>
    </tr>
  );
}

export default OrdersList;
EOF

echo ""
echo "📝 Creating Maven wrapper scripts..."

# Download Maven wrapper jar (this will be downloaded on first run)
# We'll create the scripts but the jar will auto-download

# Create mvnw for Unix/Mac/Linux
cat > backend/mvnw << 'MVNWEOF'
#!/bin/sh
# Maven Wrapper script
# This script will download Maven if needed

if [ -z "$MAVEN_PROJECTBASEDIR" ]; then
  MAVEN_PROJECTBASEDIR="$(cd "$(dirname "$0")" && pwd)"
fi

MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

WRAPPER_JAR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

DOWNLOAD_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"

if [ ! -f "$WRAPPER_JAR" ]; then
    echo "Downloading Maven Wrapper..."
    mkdir -p "$MAVEN_PROJECTBASEDIR/.mvn/wrapper"
    
    if command -v curl > /dev/null; then
        curl -o "$WRAPPER_JAR" "$DOWNLOAD_URL"
    elif command -v wget > /dev/null; then
        wget "$DOWNLOAD_URL" -O "$WRAPPER_JAR"
    else
        echo "Error: curl or wget required to download Maven Wrapper"
        exit 1
    fi
fi

exec java -cp "$WRAPPER_JAR" $WRAPPER_LAUNCHER "$@"
MVNWEOF

# Create mvnw.cmd for Windows
cat > backend/mvnw.cmd << 'MVNWCMDEOF'
@echo off
SET MAVEN_PROJECTBASEDIR=%~dp0
SET WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar
SET WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
SET DOWNLOAD_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar

if not exist %WRAPPER_JAR% (
    echo Downloading Maven Wrapper...
    if not exist %MAVEN_PROJECTBASEDIR%.mvn\wrapper mkdir %MAVEN_PROJECTBASEDIR%.mvn\wrapper
    powershell -Command "& {(New-Object Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')}"
)

java -cp %WRAPPER_JAR% %WRAPPER_LAUNCHER% %*
MVNWCMDEOF

# Make mvnw executable on Unix systems
chmod +x backend/mvnw 2>/dev/null || true

echo ""
echo "✅ Project setup complete!"
echo ""
echo "📂 Project structure created at: $(pwd)"
echo ""
echo "🔍 Next steps:"
echo "   1. Make mvnw executable (Mac/Linux only):"
echo "      chmod +x backend/mvnw"
echo ""
echo "   2. Test the setup:"
echo "      docker-compose up -d"
echo "      cd backend && ./mvnw spring-boot:run"
echo "      cd frontend && npm install && npm start"
echo ""
echo "   3. Initialize Git repository:"
echo "      git init"
echo "      git add ."
echo "      git commit -m 'Initial assessment project setup'"
echo ""
echo "   4. Push to GitHub:"
echo "      git remote add origin [YOUR_REPO_URL]"
echo "      git push -u origin main"
echo ""
echo "🎉 All files created successfully!"