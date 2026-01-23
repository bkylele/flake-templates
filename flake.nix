{
  description = "A personal collection of flake templates";

  outputs = { ... }: {
    templates = {
        rust = {
            path = "./rust";
            description = "A minimal Rust project";
        };
    };
  };
}
