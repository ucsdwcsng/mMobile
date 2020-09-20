# mMobile Mobility Dataset
Dataset for [mMobile: Building a mmWave testbed to evaluate and address mobility effects](https://wcsng.ucsd.edu/mmobile/) published in [mmNets'20]

### Overview
We relese 28 GHz full channel (CSI) measurements for a mobile user. The CSI data is tagged with each user location and for each beam index. The CSI consists of 256 subcarriers with a sub-carrier spacing of 240 kHz requisite by 5G NR standards. 

|` Setting`   | `Link-Length` | `Moving-Direction` | `Resolution` | `#points` | `Blockage `     |
|:---------:|:-----:|:---------:|:-------:|:-------:|:------------:|
| Indoor  | 2\.5m   | 90 degree    | 0\.1m   | 21      | No |
| Indoor  | 4\.2m   | 90 degree   | 0\.1m   | 32      | No |
| Outdoor | 10m     | 90 degree   | 0\.2m   | 31      | No |
| Outdoor | 30m     | 120 degree   | 0\.6m   | 45      | Yes |


Our dataset which consists of multiple indoor and outdoor experiments for up to 30 m gNB-UE link. In each experiment, we fixed the location of the gNB and move the UE with an increment of roughly one degrees. The table above specifies the direction of user movement with respect to gNB-UE link, distance resolution, and the number of user locations for which we conduct channel measurements. Outdoor 30 m data also contains blockage between 3.9 m to 4.8 m. At each location, we scan the transmission beam and collect data for each beam. By doing so, we can get the full OFDM channels for different locations along the moving trajectory with all the beam angles. Moreover, we use 240 kHz subcarrier spacing, which is consistent with the 5G NR numerology at FR2, so the data we collect will be a true reflection of what a 5G UE will see. 

## Cite the dataset 
Ish Kumar Jain, Raghav Subbaraman, Tejas Harekrishna Sadarahalli, Xiangwei Shao, Hou-Wei Lin, Dinesh Bharadia. 2020. mMobile: Building a
mmWave Testbed to Evaluate and Address Mobility Effects. In 4th ACM
Workshop on Millimeter-Wave Networks and Sensing Systems (mmNets’20),
September 25, 2020, London, United Kingdom. ACM, New York, NY, USA,
6 pages. https://doi.org/10.1145/3412060.3418433


