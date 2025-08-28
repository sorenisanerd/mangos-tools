build:
	mkosi

clean:
	rm -rf out

download:
	wget -O cosign-linux-amd64 https://github.com/sigstore/cosign/releases/download/v2.5.3/cosign-linux-amd64
	wget -O syft-linux-amd64.tar.gz https://github.com/anchore/syft/releases/download/v1.32.0/syft_1.32.0_linux_amd64.tar.gz

verify: SHA256SUMS
	sha256sum -c SHA256SUMS

syft:
	tar xzf syft-linux-amd64.tar.gz syft

cosign:
	mv cosign-linux-amd64 cosign

bootstrap: cosign syft
	SKIP_SYFT=1 mkosi

mkosi.tools:
	rm -rf mkosi.tools
	version="$$(mkosi summary --json | jq .Images[0].ImageVersion -r)"; mkdir mkosi.tools ; tar -xf out/mangos.tools_$${version}.tar.zst --zstd -C mkosi.tools 

.PHONY: mkosi.tools
