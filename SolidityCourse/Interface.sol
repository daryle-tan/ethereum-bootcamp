// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(
        address hero,
        uint enemies,
        bool armed
    ) external {
        (bool success, ) = hero.call(
            /* TODO: alert the hero with the proper calldata! */
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success);
    }
}

// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// contract Sidekick {
//     function relay(address hero, bytes memory data) external {
//         // send all of the data as calldata to the hero
//         (bool s,) = hero.call(data);
//         require(s);
//     }
// }
