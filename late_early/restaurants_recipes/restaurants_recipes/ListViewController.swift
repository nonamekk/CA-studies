//
//  ListViewController.swift
//  restaurants_recipes
//
//  Created by nonamekk on 2022-10-20.
//

import UIKit

struct ResData {
    let name: String
    let photo: UIImage
    let section: ResSection
    let description: String?
}

enum ResSection {
    case recipe
    case restaurant
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var resTableView: UITableView!
    var list: [ResData] = [
    ResData(
        name: "Pizza Jazz",
        photo: UIImage(named: "PJazz")!,
        section: ResSection.restaurant,
        description: "„PJazz“ – tai geros nuotaikos restoranai, kurie siekia ne tik patenkinti, bet ir viršyti lūkesčius. Restoranuose „PJazz“ laukia švieži ir natūralūs patiekalai, su meile pagaminti profesionalių virėjų, stilinga aplinka bei profesionalus, besišypsantis ir svetingas personalas."
        ),
    ResData(
        name: "Grill London",
        photo: UIImage(named: "GL")!,
        section: ResSection.restaurant,
        description: "„Grill London“ sparčiai augantis ir besivystantis restoranų tinklas, kuriantis modernią ir dinamišką darbo aplinką. Mes tikime, jog su mumis dirbantys žmonės yra raktas į sėkmę, juk būtent personalas, svečių vizito metu atspindi mūsų įmonės veidą bei filosofiją. Todėl ieškome ypatingų, atsidavusių darbui žmonių, gebančių sukurti grįžtamąjį ryšį su klientu, kuris galėtų jaustis laukiamas ir norėtų sugrįžti vėl!"
        ),
    ResData(
        name: "Baking Mad: Hidden Lab",
        photo: UIImage(named: "BM")!,
        section: ResSection.restaurant,
        description: "“Baking Mad Hidden Lab“, tai mistinė“, “Breaking Bad“ serialo motyvais paremta požeminė gastrolabaratorija, garsėjanti savo išskiriniais burgeriai ir mėlynojo meth'o limonadu. Atsidariusi prieš du metus, ji stebina savo lankytojus mažomis detalėmis, išskirtina kokybe ir iki išprotėjimo žinomo serialo motyvais, randamais visur - nuo lėkštės iki šviestuvo. “Baking Mad Hidden Lab” vaikai valgo nemokamai, nes šeima svarbiausia, o restoranas atviras gyvūnams."
        ),
    
    ResData(
        name: "Lietiniai blynai",
        photo: UIImage(named: "lietiniai-blynai")!,
        section: ResSection.recipe,
        description: "Ingredientai:\n" +
        "Kiaušiniai - 3 vnt.\n" +
        "Pienas - 250 g\n" +
        "Miltai - ~ 125 g\n" +
        "Saulėgražų aliejus - 1 valgomasis šaukštas\n" +
        "Druska - 0,5 arbatinio šaukštelio\n" +
        "Cukrus - 0,5-2 valgomieji šaukštai (pagal skonį)\n" +
        "Augalinis aliejus lietinių kepimui"
        ),
    ResData(
        name: "Pasta (makaronai) su aštriu jautienos faršu ir konservuotais pomidorais",
        photo: UIImage(named: "pasta-makaronai-su-astriu-jautienos-farsu-medium")!,
        section: ResSection.recipe,
        description: "Ingredientai:\n" +
        "pasta (makaronai): 120 gramų\n" +
        "liesas jautienos faršas: 150 gramų\n" +
        "konservuoti pomidorai savo sultyse: 1 skardinės (~400 gramų)\n" +
        "svogūnai: 1 (nedidelio)\n" +
        "česnakas: 2 skiltelių\n" +
        "aitriosios paprikos: 1 (nedidelės)\n" +
        "šviežio arba džiovinto raudonėlio lapeliai: 1 saujelės\n" +
        "druska\n" +
        "pipirai\n"
        ),
    ResData(
        name: "Šaltibarščiai",
        photo: UIImage(named: "Šaltibarščiai")!,
        section: ResSection.recipe,
        description: "Ingredientai:\n" +
        "marinuotų burokėlių (marinuotų obuolių sultyse): 500 gramų\n" +
        "agurkų (trumpavaisių): 3\n" +
        "svogūnų laiškų: 5-7\n" +
        "krapų: 1 (nedidelio)\n" +
        "kefyro (2,5% rieb.): 1l\n" +
        "druskos: 1 (nedidelės)\n" +
        "juodųjų pipirų (rūstų)"
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resTableView.frame = self.view.frame
        resTableView.dataSource = self
        resTableView.delegate = self
        resTableView.register(UINib(nibName: "CellView", bundle: nil), forCellReuseIdentifier: "dataCell")
    }
    
    var sendingDataToRestaurant: ((ResData) -> ())!
    var sendingDataToRecipe: ((ResData) -> ())!
    
    func performTransition(data: ResData) {
        switch(data.section) {
        case .restaurant:
            // Fatal error: unexpectedly found nil while implicitly unwrapping an Optional value
            sendingDataToRestaurant(data)
            performSegue(withIdentifier: "segueToRestaurant", sender: nil)
        case .recipe:
            sendingDataToRecipe(data)
            performSegue(withIdentifier: "segueToRecipe", sender: nil)
            
        }
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! CellView
        
        cell.cellLabel.text = self.list[indexPath.row].name
        cell.cellImageView!.image = self.list[indexPath.row].photo
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {

    /// Provides changes when table cell row is selected
    /// # Notes: #
    /// Grabs the data from selected cell, performes segue to another view
    /// and sets the data grabbed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)

        performTransition(data: self.list[indexPath.row])
    }
}

