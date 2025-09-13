<div align="center">
  
  # 🏥 Infraestructura para Licencias Médicas Electrónicas
  
  ¡Bienvenido! Este repositorio contiene la infraestructura Docker para levantar todos los servicios del sistema **Licencias Médicas Electrónicas** en entorno local.
  
  ---
</div>

## 🚀 ¿Qué incluye?

- **Base de datos unificada** (PostgreSQL)
- **Servicios:** Licencias, Portal Paciente y Validador Aseguradora
- **Red interna** para comunicación entre servicios

---

## ⚡ Requisitos previos

| Requisito         | Descripción                                  |
|-------------------|----------------------------------------------|
| Docker            | [Instalar Docker](https://docs.docker.com/)  |
| Docker Compose    | [Instalar Compose](https://docs.docker.com/compose/) |
| Repositorios      | Clonar servicios al mismo nivel que `infraestructura`  |

Árbol de directorios esperado:

```bash
workspace/
├─ infra/                    # este repositorio
├─ Licenses-Service/
├─ Pacient-Service/
└─ Insurance-Service/
```

>[!NOTE]
>
>Importante: El docker-compose.yml usa rutas relativas (../licencias, etc.), por lo que los repositorios deben existir antes de ejecutar Compose.


## 📦 Clonar los repositorios

Ejemplo para preparar el workspace:

```bash
# Crear carpeta de trabajo
mkdir workspace && cd workspace

# Clonar repositorio de infraestructura
git clone https://github.com/Contratos-Microservicios-Tarea/infrastructure.git

# Clonar servicios hermanos
git clone https://github.com/Contratos-Microservicios-Tarea/Licenses-Service.git
git clone https://github.com/Contratos-Microservicios-Tarea/Patient-Service.git
git clone https://github.com/Contratos-Microservicios-Tarea/Insurance-Service.git
```

---

## 🛠️ Levantar la infraestructura

1. Ir al directorio de infraestructura:
   ```bash
   cd infra
   ```
2. Construir las imágenes locales:
   ```bash
   docker-compose build
   ```
3. Levantar todos los servicios y la base de datos:
   ```bash
   docker-compose up -d
   ```
4. Verificar que los contenedores estén corriendo:
   ```bash
   docker-compose ps
   ```



## 🌐 URLs de acceso

| Servicio               | URL                       |
|------------------------|---------------------------|
| Licencias              | http://localhost:8001     |
| Portal Paciente        | http://localhost:8002     |
| Validador Aseguradora  | http://localhost:8003     |

> Los servicios se comunican entre sí usando la red interna de Docker Compose. Ejemplo: Portal y Validador llaman a Licencias con `http://licencias:8000`.

---

## 🧾 Notas importantes

- La base de datos se inicializa automáticamente con `db/init.sql`.
- Las rutas de build en `docker-compose.yml` apuntan a repositorios hermanos.
- Si modificas los servicios o los clonas de nuevo, **reconstruye las imágenes**:
  ```bash
  docker-compose build
  docker-compose up -d
  ```
- Para detener todos los contenedores:
  ```bash
  docker-compose down
  ```

---
