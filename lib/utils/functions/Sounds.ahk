#Requires AutoHotkey v2.0

TurnOnSound() {
    SoundPlay A_WinDir "\Media\speech on.wav"
}

TurnOffSound() {
    SoundPlay A_WinDir "\Media\speech sleep.wav"
}