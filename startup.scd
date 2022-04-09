// Kill all scsynth processes
Server.killAll;

// Start SuperDirt
SuperDirt.start;

(
var decoder = FoaDecoderMatrix.newStereo((100).degrad, (3-sqrt(3))/2);

~dirt.addModule('HRTF', { |dirtEvent|
	dirtEvent.sendSynth('HRTF' ++ ~dirt.numChannels,
		[
			theta: ~theta,
			phi: ~phi,
			out: ~out
		]
	)
}, { ~theta.notNil or: { ~phi.notNil }});
SynthDef("HRTF" ++ ~dirt.numChannels, { |out, theta, phi|
	var signal, in, left, right, foa;
	in = In.ar(out, ~dirt.numChannels);
	left = in[0];
	right = in[1];
	// Make it like mono to counteract the effect of the pan effect.
	in = [(left+right), (left+right)];
	// theta is our angle on the X-Y plane and phi is our elevation
	theta = (theta-1) * pi;
	phi = phi * (-pi/2);
	// Encode into our foa signal
    foa = FoaPanB.ar(in, theta, phi);
	// decode our signal using our decoder defined above
    signal = FoaDecode.ar(foa, decoder);
	ReplaceOut.ar(out, signal)
}, [\ir]).add;
)
