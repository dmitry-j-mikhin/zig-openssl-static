# SHA256 Example in Zig with OpenSSL

This project demonstrates how to compute a SHA256 hash in Zig using OpenSSL. The program hashes a given message and outputs the result in hexadecimal format.

## Project Overview

The `sha256_example.zig` program:
1. Uses the OpenSSL C library to compute the SHA256 hash of a given string.
2. Outputs the SHA256 digest in a readable hexadecimal format.

## Requirements

To build and run this project, you need:
- Zig (tested with Zig on Alpine Linux)
- OpenSSL library (for SHA256 hashing)
- A Linux environment (Alpine recommended for CI compatibility)

## Code Usage

```bash
zig run -lc -lcrypto sha256_example.zig
```

The output should look like:
```
SHA256 digest for 'Hello, Zig and OpenSSL!': b3b75963d020e3c135fe6635c8034692fd7456347101a1a61fb87b572c5cac16
```

## GitHub Actions Workflow

The `.github/workflows/release.yml` defines a CI/CD pipeline with two main jobs:

1. **Build**: 
   - Runs on each tagged commit.
   - Builds a static binary for the SHA256 example code and stores it as an artifact.
2. **Release**:
   - Uses the built artifact to create a GitHub Release.
   - Uploads the binary as an asset to the release.

### Workflow Variables

- `LINUX_AMD64_BINARY`: Name pattern for the output binary.

### Building Locally

To manually build the binary:
```bash
zig build-exe -O ReleaseSmall -mcpu baseline -static -lc -lcrypto -femit-bin=sha256_example-amd64 sha256_example.zig
```

### Workflow Trigger Example

To trigger the GitHub Actions workflow, push a commit with a Git tag:
```bash
git tag -a v1.0.0 -m "Initial release"
git push origin v1.0.0
```

This will:
- Build the binary.
- Create a release on GitHub with the binary attached.

### Releases

https://github.com/dmitry-j-mikhin/zig-openssl-static/releases

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
