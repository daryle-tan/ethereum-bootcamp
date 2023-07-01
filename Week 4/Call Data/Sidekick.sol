// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // TODO: alert the hero using the IHero interface
        IHero(hero).alert();
    }
}

// contract Sidekick {
    // function signature
//     function sendAlert(address hero) external {
//         // TODO: fill in the function signature
//         bytes4 signature = bytes4(keccak256("alert()"));

//         (bool success, ) = hero.call(abi.encodePacked(signature));

//         require(success);
//     }
// }

// contract Sidekick {
//     using encodeWithSignature
//     function sendAlert(address hero, uint enemies, bool armed) external {
//         (bool success, ) = hero.call(
//             /* TODO: alert the hero with the proper calldata! */
//             abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
//         );

//         require(success);
//     }
// }

// contract Sidekick {
//     // relay 
//     function relay(address hero, bytes memory data) external {
//         // send all of the data as calldata to the hero
//         (bool success,) =  hero.call(data);
//         require(success);
       
//     }
// }

// contract Sidekick {
//     // trigger fallback function
//     function makeContact(address hero) external {
//         // TODO: trigger the hero's fallback function!
//         (bool s, ) = hero.call(abi.encodeWithSignature("alert(uint,bool)", 3, true));
//         require(s);
//     }
// }