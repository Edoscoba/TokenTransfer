import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TokenTransfer = buildModule("TokenTransfer", (m) => {
    console.log("deploying contract....");
    const tokenTransfer = m.contract("TokenTransfer");
    

console.log(`contract deployed to:  ${tokenTransfer}`);

    return { tokenTransfer };
});

export default TokenTransfer;