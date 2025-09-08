# Changelog

All notable changes to Laravel Cloud Local will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2025-09-08

### Added
- Initial public release of Laravel Cloud Local
- Automated binary distribution system
- Support for multiple platforms:
  - Linux (AMD64 and ARM64)
  - macOS (Intel and Apple Silicon)
  - Windows (AMD64)
- Zero-configuration Laravel development environment
- Full Laravel Cloud parity with FrankenPHP
- Complete service stack (MySQL/PostgreSQL, Redis, Queue Workers, S3-compatible storage)
- Developer tools (Xdebug, Telescope, MailHog)
- Cost estimation for Laravel Cloud usage
- HTTPS by default with automatic SSL certificates

### Fixed
- Analyzer tests for Laravel project detection
- Laravel version detection from composer.json

### Infrastructure
- Established two-repository system (private source, public binaries)
- Automated CI/CD pipeline with GitHub Actions
- SHA256 checksums for all releases

## [0.2.1] - 2025-09-08

### Fixed
- Release workflow build command to include all source files

## [0.2.0] - 2025-09-08

### Added
- Initial test release with automated workflow

## [0.1.1] - 2025-09-08

### Added
- Testing automated binary distribution workflow

## [0.1.0] - 2025-09-08

### Added
- Initial release for testing the automated binary distribution

---

## Previous Development (Pre-release)

### Phase 8 - Polish & Production Ready
- Added comprehensive `lcl update` command with version checking
- Implemented automatic update notifications
- Added rollback capability for failed updates

### Phase 7 - Package Management & Assets
- Added `lcl assets` command for asset management
- Support for npm, yarn, pnpm, and bun package managers
- Asset building, watching, and publishing capabilities

### Phase 6 - Service Management
- Added service management commands (logs, exec, artisan, tinker, db)
- Implemented comprehensive database operations
- Added configuration management system

### Phase 5 - Cost Estimation
- Implemented `lcl cost` command for Laravel Cloud cost estimation
- Added resource usage tracking
- Cost breakdown by service type

### Phase 4 - Deployment Preview
- Added `lcl deploy` command for simulating deployment pipeline
- Implemented `lcl preview` for branch-based preview environments
- Added deployment validation and checks

### Phase 3 - Core Services
- Implemented MySQL/PostgreSQL database support
- Added Redis for cache and queues
- Integrated MinIO for S3-compatible storage
- Added MailHog for email testing

### Phase 2 - Docker Integration
- Created Docker Compose generation system
- Implemented FrankenPHP configuration
- Added Octane support detection

### Phase 1 - Project Analysis
- Built Laravel project analyzer
- Automatic detection of PHP version, Laravel version, and dependencies
- Configuration detection from composer.json and .env files

### Phase 0 - Initial Setup
- Project structure established
- Core command structure with Cobra
- Basic CLI framework

[0.3.0]: https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/tag/v0.3.0
[0.2.1]: https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/tag/v0.2.1
[0.2.0]: https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/tag/v0.2.0
[0.1.1]: https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/tag/v0.1.1
[0.1.0]: https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/tag/v0.1.0