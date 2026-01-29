{
  description = "A personal collection of flake templates";

  outputs = { ... }: {
    templates = {
        test = {
            path = ./test;
            description = "A barebones flake for trying software";
        };
        rust = {
            path = ./rust;
            description = "A minimal Rust project";
        };
    };
  };
}
