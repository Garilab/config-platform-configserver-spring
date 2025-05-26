# 🛠️ Config Server (.NET + Azure Key Vault)

Este servicio actúa como un **Config Server centralizado**, proporcionando configuraciones a otras aplicaciones dentro del ecosistema. Las configuraciones se almacenan en un repositorio Git y se complementan con secretos almacenados en **Azure Key Vault**.

---

## 📦 Características

- Gestión centralizada de configuraciones para múltiples entornos.
- Backend basado en Git (GitHub, GitLab, Azure Repos, etc.).
- Integración con Azure Key Vault para manejar secretos de forma segura.
- Cache opcional de configuraciones.
- Permite autenticación y autorización con tokens JWT.
- Compatible con despliegue en Docker y Kubernetes.
