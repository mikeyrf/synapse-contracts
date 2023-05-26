// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import "../libraries/BridgeStructs.sol";

interface ISwapQuoter {
    function findConnectedTokens(LimitedToken[] memory tokensIn, address tokenOut)
        external
        view
        returns (uint256 amountFound, bool[] memory isConnected);

    function getAmountOut(
        LimitedToken memory tokenIn,
        address tokenOut,
        uint256 amountIn
    ) external view returns (SwapQuery memory query);

    function allPools() external view returns (Pool[] memory pools);

    function poolsAmount() external view returns (uint256 tokens);

    function poolInfo(address pool) external view returns (uint256 tokens, address lpToken);

    function poolTokens(address pool) external view returns (PoolToken[] memory tokens);

    function calculateAddLiquidity(address pool, uint256[] memory amounts) external view returns (uint256 amountOut);

    function calculateSwap(
        address pool,
        uint8 tokenIndexFrom,
        uint8 tokenIndexTo,
        uint256 dx
    ) external view returns (uint256 amountOut);

    function calculateRemoveLiquidity(address pool, uint256 amount) external view returns (uint256[] memory amountsOut);

    function calculateWithdrawOneToken(
        address pool,
        uint256 tokenAmount,
        uint8 tokenIndex
    ) external view returns (uint256 amountOut);
}
