{
  description = "A personal collection of flake templates";

  outputs = { ... }: {
    templates = {
        default = {
            path = ./default;
            description = "A barebones flake for trying software";
        };
        rust = {
            path = ./rust;
            description = "A minimal Rust project";
        };
    };
  };
}
