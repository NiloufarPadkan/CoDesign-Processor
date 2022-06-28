let readline = require("readline");

let input = [];
let opcode, RX, RY;

function convertToBinary(number) {
    //convert integer o binary
    if (number > 0) {
        return convertToBinary(parseInt(number / 2)) + (number % 2);
    }
    return "";
}

function pad(s, size) {
    //adds padding to binary number
    while (s.length < size) s = "0" + s;
    return s;
}

function RsrcNumber(Rsrc) {
    let rx;
    switch (Rsrc) {
        case "R0":
            rx = "00";
            break;
        case "R1":
            rx = "01";
            break;
        case "R2":
            rx = "10";
            break;
        case "R3":
            rx = "11";
            break;
        default:
            break;
    }

    return rx;
}

function RdestNumber(Rsrc) {
    let ry;
    switch (Rsrc) {
        case "R0":
            ry = "00";
            break;
        case "R1":
            ry = "01";
            break;
        case "R2":
            ry = "10";
            break;
        case "R3":
            ry = "11";
            break;
        default:
            ry = "00";
            break;
    }

    return ry;
}

let rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.prompt();

rl.on("line", function (cmd) {
    input.push(cmd);
});

rl.on("close", function (cmd) {
    input = input.join("\n");
    let userInput = input.split(/\r?\n/);
    console.log(userInput);

    for (let i = 0; i < userInput.length; i++) {
        let inst = userInput[i].split(" ");
        switch (inst[0]) {
            case "LOAD":
                opcode = "000";
                RX = RsrcNumber(inst[1]);
                RY = "11";
                console.log(opcode + RX + RY);

                break;

            case "ADD":
                opcode = "001";
                RX = RsrcNumber(inst[1]);
                RY = RdestNumber(inst[2]);
                console.log(opcode + RX + RY);

                break;

            case "SUB":
                opcode = "010";
                RX = RsrcNumber(inst[1]);
                RY = RdestNumber(inst[2]);
                console.log(opcode + RX + RY);

                break;

            case "JNZ":
                opcode = "011";
                RX = RsrcNumber(inst[1]);
                RY = "00";
                console.log(opcode + RX + RY);
                break;

            case "MUL":
                opcode = "100";
                RX = RsrcNumber(inst[1]);
                RY = RdestNumber(inst[2]);
                console.log(opcode + RX + RY);
                break;

            case "HLT":
                console.log(pad("0", 7));
                break;

            default:
                break;
        }

        if (inst[0] == "LOAD" || inst[0] === "JNZ")
            console.log(pad(convertToBinary(parseInt(inst[2])), 7));
    }

    process.exit(0);
});
