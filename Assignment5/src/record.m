close('all'); clear; clc;

fs = 44100; nbits = 8; length = 5;
% Record your voice for 5 seconds.
recObj = audiorecorder(fs, nbits,1);
disp('Start speaking.');
recordblocking(recObj, length);
disp('End of Recording.');
% Play back the recording.
play(recObj);
% Store data in double-precision array
myRecording = getaudiodata(recObj);
subplot(2,1,1); plot(myRecording); % Plot the waveform

audiowrite('./assets/my_voice.wav', myRecording, fs);

[sigread, fsread] = audioread('./assets/my_voice.wav');
subplot(2,1,2); plot(sigread); % Plot the waveform.
