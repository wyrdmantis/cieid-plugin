import { CieId } from 'cieid-plugin';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CieId.echo({ value: inputValue })
}
