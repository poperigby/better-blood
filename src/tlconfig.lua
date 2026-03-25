return {
    build_dir = "scripts",
    source_dir = "scripts",
    -- Read Teal declarations from the Nix store
    include_dir = { os.getenv("TEAL_DECLARATIONS") }
}
