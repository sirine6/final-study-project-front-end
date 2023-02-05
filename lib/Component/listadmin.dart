
/*
class Listadmin extends StatelessWidget {
  const Listadmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
           onTap: (){
                       showDialog(context: context,
                      builder: (context){
                      return ModifDialogue();
                      });
                                    },
            child: const Icon(
              FontAwesomeIcons.edit,
              size: 15,
              color: Colors.grey,
            )),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: (){
                       showDialog(context: context,
                      builder: (context){
                      return SupprimerDialogue();
                      });
                                    },
            child: const Icon(
              FontAwesomeIcons.trash,
              size: 15,
              color: Colors.grey,
            )),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {},
            child: const Icon(
              FontAwesomeIcons.eye,
              size: 15,
              color: Colors.grey,
            )),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {},
            child: const Icon(
              FontAwesomeIcons.cog,
              size: 15,
              color: Colors.grey,
            )),
      ],
    );
  }
}
*/
