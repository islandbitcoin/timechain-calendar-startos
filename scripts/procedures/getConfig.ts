import { compat } from "../deps.ts";

export const getConfig = compat.getConfig({
  "lan-address": {
    "name": "LAN Address",
    "description": "The LAN address of the mempool interface",
    "type": "pointer",
    "subtype": "package",
    "package-id": "mempool",
    "target": "lan-address",
    "interface": "main",
  }
});
