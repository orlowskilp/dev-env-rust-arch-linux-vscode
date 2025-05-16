# Build the library with the specified tool chain. Defaults to x86_64-unknown-linux-gnu
.PHONY: build
build: format lint
	cargo build --release

# Build documentation for the library
.PHONY: doc
doc:
	cargo fmt --check
	cargo doc --no-deps

# Run all tests (no coverage)
.PHONY: test
test:
	cargo test --workspace

# Clean up
.PHONY: clean
clean:
	cargo clean

# ==== Directives for developers ====

# Run unit and integration tests and measure coverage.
# Additional flags can be passed with LLVM_COV_ARGS
.PHONY: test-coverage
test-coverage:
	cargo llvm-cov $(LLVM_COV_ARGS)

# Run only documentation tests (shorthand for developers)
.PHONY: doc-test
doc-test:
	cargo test --doc

# Run only unit tests (shorthand for developers)
.PHONY: unit-test
unit-test:
	cargo test --lib

# Run only integration tests (shorthand for developers)
.PHONY: integration-test
integration-test:
	cargo test --test '*'

# ==== Helper directives ====

# Format codebase
.PHONY: format
format:
	cargo fmt

# Lint codebase
.PHONY: lint
lint:
	dprint check
	cargo fmt --all --check
	cargo clippy --all-targets --all-features -- -D warnings
