module.exports = {
  apps: [{
    name: "calculadora-ipv6",
    script: "app.py",
    interpreter: "python",
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: "1G",
    env: {
      FLASK_ENV: "production",
      PORT: 5000
    }
  }]
}
