# SimpleMvcApp

This is a minimal ASP.NET Core MVC application built with .NET 8, designed to test GitHub Actions CI/CD pipelines.

## Local Setup

```bash
# Restore dependencies
cd SimpleMvcApp
# (If you cloned this repo elsewhere, run this in the repo root)
dotnet restore
# Build the solution

dotnet build
# Run the web application

dotnet run --project src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj
```

The application will be available at `https://localhost:5001` (or `http://localhost:5000`). Use the navigation links to view the Home, About, and Contact pages.

## Running Tests

```bash
# Run unit tests for CalculatorService
cd SimpleMvcApp

dotnet test --verbosity normal
```

All tests should pass.

## CI/CD Workflow

The `.github/workflows/ci.yml` file sets up a pipeline that:

1. Restores dependencies
2. Builds the solution
3. Runs unit tests and publishes test results
4. Scans the codebase with Trivy, failing on HIGH or CRITICAL vulnerabilities
5. Publishes the web app build output
6. Uploads the resulting artifact

The workflow is triggered on pushes and pull‑requests.

---

**Tip:** To view the workflow logs, go to the **Actions** tab in your GitHub repository after a push.
