# Security Policy

## Laravel Cloud Local Security

Laravel Cloud Local (LCL) is committed to maintaining the highest security standards for our users. While LCL is closed-source software, we prioritize transparency in our security practices.

## Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 0.3.x   | :white_check_mark: |
| 0.2.x   | :x:                |
| 0.1.x   | :x:                |

## Security Measures

### Binary Verification

All LCL releases undergo:
- Automated vulnerability scanning
- Malware detection
- Dependency vulnerability checks
- Binary integrity verification

### Code Signing

- **macOS**: Binaries are signed with Apple Developer certificates
- **Windows**: Authenticode signing (coming soon)
- **Linux**: GPG signatures available for verification

### Verification Instructions

#### Linux/macOS GPG Verification
```bash
# Import our public key
curl -fsSL https://raw.githubusercontent.com/RianMorningstar/laravel-cloud-local-releases/main/lcl-public.key | gpg --import

# Verify the binary
gpg --verify lcl.sig lcl
```

#### Checksum Verification
```bash
# Download checksums
curl -fsSL https://github.com/RianMorningstar/laravel-cloud-local-releases/releases/latest/download/checksums.txt

# Verify your binary
shasum -a 256 -c checksums.txt
```

## Security Practices

### Development
- Secure coding standards enforcement
- Regular dependency updates
- Static code analysis on every commit
- Container image scanning

### Runtime Security
- No telemetry or data collection
- All operations run locally
- No external API calls except for updates
- Filesystem operations limited to project directory

### Docker Security
- Official base images only
- Non-root container execution
- Minimal attack surface
- Regular security patches

## Vulnerability Disclosure

We take security vulnerabilities seriously. If you discover a security issue:

### Reporting Process

1. **DO NOT** create a public GitHub issue
2. Email security details to: security@laravel-cloud-local.dev
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### Response Timeline

- **Initial Response**: Within 24 hours
- **Status Update**: Within 72 hours
- **Resolution Target**: Within 7-14 days for critical issues

### Disclosure Policy

We follow coordinated disclosure:
1. Acknowledge receipt of report
2. Investigate and validate the issue
3. Develop and test a fix
4. Release security update
5. Public disclosure after patch release

## Security Audit

LCL undergoes regular security assessments:
- Quarterly dependency audits
- Annual third-party security review
- Continuous automated scanning

## Data Privacy

### What LCL Does NOT Do:
- ❌ Collect usage analytics
- ❌ Send project data externally
- ❌ Track user behavior
- ❌ Store personal information

### What LCL DOES:
- ✅ Check for updates (version only)
- ✅ Download Docker images (from official registries)
- ✅ Operate entirely locally

## Software Bill of Materials (SBOM)

An SBOM is available for each release:
- Format: SPDX JSON
- Location: Release assets
- Filename: `lcl-sbom.json`

## Security Features

### Network Isolation
- Containers run in isolated networks
- No external port exposure by default
- Firewall-friendly configuration

### Secret Management
- Environment variables isolated per container
- No hardcoded credentials
- Secure defaults for all services

## Compliance

LCL development follows:
- OWASP Secure Coding Practices
- CIS Docker Benchmark
- NIST Cybersecurity Framework

## Security Updates

Stay informed about security updates:
- Watch our [GitHub repository](https://github.com/RianMorningstar/laravel-cloud-local-releases)
- Check `lcl update` regularly
- Subscribe to release notifications

## Contact

For security concerns, contact:
- Email: security@laravel-cloud-local.dev
- Response time: 24-48 hours

For general support:
- GitHub Issues: [Report an issue](https://github.com/RianMorningstar/laravel-cloud-local-releases/issues)

---

*Last updated: September 2025*
*Security policy version: 1.0*