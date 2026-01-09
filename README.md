# 🛡️ TrackForge

TrackForge is a high-performance, feature-rich scoring server for **Cyber Capture the Flag (CTF)** events. Built with Ruby on Rails 7 and designed for flexibility, it provides everything you need to host, manage, and track a professional cybersecurity competition.

---

## 🚀 What can you do with TrackForge?

TrackForge is more than just a scoreboard; it's a complete CTF orchestration platform.

### 🏁 For Competitors
*   **Interactive Scoreboard**: Real-time rankings with visual progress bars for every team.
*   **Dynamic Challenges**: Solve trivia, crypto, web exploitation, and more.
*   **On-Demand Environments**: Spin up dedicated Docker containers for specific challenges directly from the browser.
*   **Hint Marketplace**: Purchase hints using points to overcome blockers.
*   **Team Collaboration**: Join forces with teammates and track collective progress.
*   **Live Chat**: Communicate with other participants and admins in real-time.

### 🛠️ For Administrators
*   **Full Web Management**: Create, edit, and delete challenges and hints without touching the database.
*   **Statistics Dashboard**: Deep insights into competition progress, category-wise performance, and "most-solved" challenges.
*   **Bracket System**: Group teams into brackets (e.g., High School, Professional) with custom handicap settings.
*   **Automated Deployment**: Integrated support for Docker Swarm to manage challenge infrastructure.
*   **Secure Submissions**: Rate-limiting and regex-based flag validation to prevent brute-forcing.
*   **Flexible Storage**: Native integration with Cloudinary for challenge assets and images.

---

## 🎯 Use Cases
*   **Educational Workshops**: Perfect for schools and universities to host internal cybersecurity labs.
*   **Corporate Training**: Upskill your security team with private, internal CTF events.
*   **Public Competitions**: Scale to hundreds of users for large-scale public hacking events.
*   **Recruitment**: Use CTF challenges to vet potential security hires.

---

## ⚙️ Getting Started

### Prerequisites
*   **Docker** and **Docker Compose**
*   **Make** (optional, but recommended)

### Quick Start with Docker

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/flagforgeCTF/trackforge.git trackforge
    cd trackforge
    ```

2.  **Configure Environment**:
    ```bash
    cp .env_sample .env
    # Edit .env with your settings
    ```

3.  **Start everything**:
    ```bash
    make up          # Start containers
    make db-reset    # Initialize database
    ```

4.  Visit `http://localhost:3000`

### Available Make Commands

```bash
make help        # Show all available commands
make build       # Build the Docker image
make up          # Start containers
make down        # Stop containers
make restart     # Restart containers
make logs        # View web logs
make db-migrate  # Run database migrations
make db-seed     # Seed the database
make db-reset    # Migrate + seed database
make shell       # Open shell in web container
make console     # Open Rails console
make assets      # Precompile assets
make status      # Show container status
make clean       # Remove containers and volumes
```

### Local Development (without Docker)

1.  **Install dependencies**:
    ```bash
    bundle install
    ```

2.  **Setup the Database**:
    ```bash
    bundle exec rails db:setup
    bundle exec rails db:seed
    ```

3.  **Start the Server**:
    ```bash
    bundle exec rails s
    ```

---

## 📖 How to Use

### 👤 Admin Access
After seeding the database, you can log in with:
*   **Email**: `admin@gmail.com`
*   **Password**: `password`
*   *Note: Change these immediately after your first login!*

### 🧩 Creating Challenges
1.  Navigate to the **Admin Console** (Cog icon in the navbar).
2.  Go to **Problems** -> **New Problem**.
3.  Define the name, category, points, and the flag (solution).
4.  (Optional) Add hints with point deductions to help struggling players.

### 📊 Tracking Progress
Use the **Statistics** tab to monitor the health of your event. You can see which categories are being cleared and identify if any challenges are too difficult or too easy based on solve rates.

---

## 🐳 Deployment Options

### Docker Compose (Recommended for Local/Dev)
```bash
make up
make db-reset
```

### Docker Swarm (Production)
```bash
make up-swarm
```
Refer to the [Docker README](DOCKER_README.md) for detailed swarm configuration.

### Heroku
1.  Set the `HOST` environment variable.
2.  Add the `SendGrid` addon for emails.
3.  Add `Redis To Go` for ActionCable (live updates).

---

## 🤝 Contributing
We welcome contributions! If you have a feature request or a bug fix:
1.  Fork the repo.
2.  Create a feature branch (`git checkout -b feature/amazing-feature`).
3.  Commit your changes.
4.  Push to the branch and open a Pull Request.

---

## 📜 License
This project is licensed under the **MIT License**. See the `LICENSE` file for details.

---
*Developed by Flagforge.*
