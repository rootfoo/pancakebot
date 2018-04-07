#!/usr/bin/python

from time import sleep
import os

gpio_relay = 'gpio49'
gpio_temp = None


class Gpio(object):

    def __init__(self, gpio_num, direction='out'):
        self.base = '/sys/class/gpio/gpio{n}'.format(n=gpio_num)
        with open(os.path.join(self.base, 'direction'), 'w') as f:
            f.write(direction)

    def __value__(self, data):
        with open(os.path.join(self.base, 'value'), 'w') as f:
            f.write(data)

    def on(self):
        self.__value__('1')

    def off(self):
        self.__value__('0')


if __name__=='__main__':

    g = Gpio('gpio49')
    while True:
        g.on()
        sleep(10*60)
        g.off()
        sleep(5*60)




