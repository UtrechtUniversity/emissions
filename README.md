# Emissions in The Netherlands in 2030

Emissions of CO2 and NOx play a key role in global warming. In this project,
we aim to predict the CO2 emission and NOx emission in The Netherlands in
2030. This project is one of the demonstration projects of the workshop
[Computational Reproducibility](https://github.com/UtrechtUniversity/workshop-computational-reproducibility) at [Utrecht
University](https://www.uu.nl). The workshop is organised by [Research Data
Management Support](https://www.uu.nl/en/research/research-data-management).


## Getting Started

This section contains instructions on running the analyses for this project. 

### Prerequisites

The code in this repository is written in R. If you do not have R installed,
download it from the [R project website](https://www.r-project.org/) and follow the
installation instructions. RStudio can be used as an interface for intuitive and fast
development. Check out the [Rstudio website](https://www.rstudio.com/) to
download and install the program.

Using RStudio:

- Open `install.R`
- Run the script (CTRL+SHIFT+ENTER)

Using the command line:

```
Rscript install.R
```

### Data

The data [data/Emissions_to_air__ro_190918144657.csv](data/Emissions_to_air__ro_190918144657.csv) 
was downloaded on September 19, 2018 from the Dutch Bureau of Statistics at [statline.cbs.nl](http://statline.cbs.nl/Statweb/selection/VW=T&DM=SLEN&PA=7063ENG&D1=a&D2=a&D3=a&LA=EN&HDR=T&STB=G1,G2). In 'topics', we selected greenhouse
gases only (CO2, N2O, and CH4), but selected all sources and periods
(1980-2017). The data was downloaded as a csv.

**Note** that Statline has been renewed and the above link may no longer function. In
this case, visit [opendata.cbs.nl](https://opendata.cbs.nl/statline/#/CBS/en/dataset/7063eng/table?ts=1537862508225) and perform the described selection. We
recommend comparing the header and footer of the resulting document with the
input csv file in the data folder, to ensure they match.


### Run the analysis


- Run `scripts/data_cleaning.R`
- Run `scripts/analysis.R`

The results, datasets and figures are stored in the `/output` folder.


## Running the tests

This project contains no tests at this moment.

## Contributing

Any remarks and contributions can be proposed in the issue tracker
https://github.com/UtrechtUniversity/emissions/issues. 

## Versioning

This project makes use of versions control through Git and is hosted on
Github. For the versions available, see the [tags on this repository](https://github.com/UtrechtUniversity/emissions/tags).

## Citation 

The content of this repository is open source. If you use this project for one of
your research articles, please cite our work:

```
@misc{foo2010,
  author = "Vreede, B and De Bruin, J",
  journal = "N/A",
  year = 2019,
  title = "N/A",
  doi = {10.1.1.not.really.a.doi},
  url = {http://dx.doi.org/10.1.1.not.really.a.doi}
}
```

## Authors

* **Barbara Vreede** - [bvreede](https://github.com/bvreede)
* **Jonathan de Bruin** - [J535D165](https://github.com/J535D165)

See also the list of
[contributors](https://github.com/your/project/contributors) who participated
in this project.

## License

This project is licensed under the MIT - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Utrecht University - Research Data Management Support](https://www.uu.nl/en/research/research-data-management)
* [Big list of people and their links](http://example.org/)

## Disclaimer

This project is one of the demonstration projects of the workshop
[Computational Reproducibility](https://github.com/UtrechtUniversity/workshop-computational-reproducibility) at [Utrecht
University](https://www.uu.nl). The workshop is organised by [Research Data
Management Support](https://www.uu.nl/en/research/research-data-management).
The content of the project is for illustration purposes only. 

Research projects and computational reproducible research can be debated. This
project provides one of the solutions to setting up, managing and publishing a
research project. We know that there is much more to share on this topic.
Unfortunately, it is not possible to cover everything. Nevertheless, we
appreciate all feedback on this demonstration project and the workshop.












