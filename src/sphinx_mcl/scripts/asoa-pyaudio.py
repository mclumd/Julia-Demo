import scipy.io.wavfile
import pyaudio
import wave
import time
import sys
import tempfile
import subprocess

PATH_TO_TEXT2WAVE="/home/justin/research/perlis/auditory-soa/text2wave"


class asoa_io:
    text_to_synth = ""
    template_file = ""
    template_wave = []
    template_rate = 0
    template_length = 0
    template_idx = 0
    template_framesize = 0

    signal_wave = []
    
    pa = pyaudio.PyAudio()
    
    """ Synthesize the speech and do any preprocessing.
        Note that we want to use the kal_diphone voice for synthesis.
    """
    def __init__(self, text_string):
        temp_fd, template_file = tempfile.mkstemp()
        string_file = tempfile.NamedTemporaryFile()

        string_file.write(text_string)
        string_file.flush()
        string_file.close()

        if (subprocess.call([PATH_TO_TEXT2WAVE, string_file.name, "-o", template_file]) > 0):
                print "Error running text2wave"

        template_rate, template_wave = scipy.io.wavfile.read(template_file)
        template_length = len(template_wave)

        input_stream = pyaudio.Stream(rate = template_rate, input=True, stream_callback = read_callback)
        output_stream = pyaudio.Stream(rate = template_rate, output=True, stream_callback = write_callback)


    def start_speech():
        
    
    def write_callback(in_data, frame_count, time_info, status):
        data = template_wave[template_idx*template_framesize:(template_idx+1)*template_framesize - 1]
        template_idx++
        return (data, pyaudio.paContinue)

    def read_callback(in_data, frame_count, time_info, status):
        signal += in_data  # This has the incoming signal as a list of frames.
        return (in_data, pyaudio.paContinue)
    
