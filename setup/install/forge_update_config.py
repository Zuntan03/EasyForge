import json
import os
import sys


class ForgeConfig:
    def __init__(self, cfg_path):
        self.updaters = {"0.0.0": self.update_0_0_0}
        self.enable_civitai_browser_plus = cfg_path == "config-CivitaiBrowserPlus.json"

        if not os.path.exists(cfg_path):
            with open(cfg_path, "w", encoding="utf-8") as f:
                json.dump({}, f)

        with open(cfg_path, "r+", encoding="utf-8") as f:
            cfg = json.load(f)
            if "easy_forge_config_version" not in cfg:
                cfg["easy_forge_config_version"] = "0.0.0"

            # cfg["easy_forge_config_version"] = "0.0.0" # For testing
            if self.update(cfg):
                f.seek(0)
                json.dump(cfg, f, indent=4)
                f.truncate()

    def update(self, cfg):
        version = cfg["easy_forge_config_version"]
        if version not in self.updaters:
            return False
        self.updaters[version](cfg)
        self.update(cfg)
        return True

    def update_0_0_0(self, cfg):
        cfg["easy_forge_config_version"] = "0.1.0"

        cfg["export_for_4chan"] = False
        cfg["lora_preferred_name"] = "Filename"
        cfg["ui_extra_networks_tab_reorder"] = "Checkpoints,LoRA,Textual Inversion"
        cfg["emphasis"] = "No norm"
        if self.enable_civitai_browser_plus:
            cfg["disabled_extensions"] = []
        else:
            cfg["disabled_extensions"] = ["sd-civitai-browser-plus"]
        cfg["dp_wildcard_manager_no_sort"] = True

        # cfg["quick_setting_list"] = ["tac_tagFile"]
        # cfg["extra_networks_tree_view_default_enabled"] = True
        # cfg["extra_networks_tree_view_style"] = "Tree"
        # cfg["lora_show_all"] = True
        # cfg["interrupt_after_current"] = False
        # cfg["ch_dl_lyco_to_lora"] = True
        # cfg["ch_nsfw_threshold"] = "XXX"


if __name__ == "__main__":
    forge_config = ForgeConfig(sys.argv[1])
